#!/usr/bin/python

""" FarmBot API with support from ROS. FarmBot is a robot that travels autonomously across soil and plants different types of seeds.
The Bot will water each seed after depositing it for the first time. The Bot is not made to perform watering tasks. 
Tracking of the Bot is done using encoder readings and accelerometer readings. 

The Bot is driven by a 4 wheeled drive using 4 dynamixel motors at each wheel. Differential trust is used to steer the Bot
left or right. The wheels are controlled by the Arudino unit at the base which subscribes to a ROS topic that listens to wheel 
velocities. At the head, the Raspberry Pi (model 3) performs computation on tilt angles and publishes goal state and wheel velocities.
This Python script resides in the farm_bot_driver package 
"""

import rospy
import math
import numpy as numpy
import datetime 
import time
import sys
from std_msgs.msg import Bool
from farm_bot_driver.msg import wheel_velocity_msg
from imu_reader.msg import veh_state_msg
from arduino_driver.msg import encoder_vel_msg
from imu_reader.srv import pid_control_req

class noSeedException(Exception):
	# No seed exception class
 	def __init__(self, msg):
 		Exception.__init__(self, msg)


class vehStuckException(Exception):
	# Vehicle stuck exception class
 	def __init__(self, msg):
 		Exception.__init__(self, msg)


class farmBotDriver:
	# Main controller for FarmBot
	def __init__(self, name, timestep=0.1):
		# User to define the timestep used

		self.name					= name
		self.timestep 				= timestep			# Seconds
		self.freq 					= 1/timestep		# Hz
		self.vel_limit 				= 100				# Each wheel can only have a max angular velocity starting from 0
		# self.__imu_reading 			= {'acc_x':0, 'acc_y':0, 'ang_roll':0, 'ang_pitch':0, 'ang_yaw':0}
		
		# Velocity for X / Y axis and theta degrees for R / P / Y
		self.__state_vect			= {'vx':0, 'vy':0, 'th_roll':0, 'th_pitch':0, 'th_yaw':0}
		self.__vel_encoder_avg		= 0 

		# Initialize publisher
		self.goal_state_publisher 	= rospy.Publisher('goal_state', Bool)
		self.wheel_vel_publisher 	= rospy.Publisher('wheel_vel', wheel_velocity_msg)

		# Initialize subscriber 
		rospy.Subscriber('veh_state', veh_state_msg, self.__veh_state_callback)
		rospy.Subscriber('encoder_vel', encoder_vel_msg, self.__vel_encoder_callback)
		rospy.init_node('Farm_Bot_driver', anonymous=True, log_level=rospy.INFO)

		self.rate 					= rospy.Rate(self.freq)	
		date_time 					= datetime.datetime.now()

		rospy.loginfo(rospy.get_caller_id() + '-> Starting farm bot operation at -> ' + date_time.isoformat())
		print("Initializing {0}".format(self.name))


	def __str__(self):
		return '{0} says hello!'.format(self.name)


	def __veh_state_callback(self, data):
		# Callback function for vehicles velocity and tilt angle
		# vx and vy are the velocities in the vehicle reference frame 
		self.__state_vect['vx'] 		= data.vx
		self.__state_vect['vy'] 		= data.vy
		self.__state_vect['th_roll'] 	= data.th_roll
		self.__state_vect['th_pitch'] 	= data.th_pitch
		self.__state_vect['th_yaw'] 	= data.th_yaw


	def __vel_encoder_callback(self, data):
		# Callback function for average wheel velocities using published readings
		self.__vel_encoder_avg	= np.average([data.v_FL, data.v_FR, data.v_BL, data.v_BR])


	def __pub_wheel_vel(self, vel_dict):
		"""
		Function publishes desired wheel velocities as given in vel_dict to the 'wheel_vel' topic

		Input : vel_dict is of type dict with keys {'FR' , 'FL' , 'BR' , 'BL'}
		"""
		key_str 	= ['FL' , 'FR' , 'BL' , 'BR']

		for strtmp in key_str:
			try:
				# Asserts velocities are within angular velocity limited range
				assert (vel_dict[strtmp] <= self.vel_limit and vel_dict[strtmp] >= 0)

			except AssertionError:
				err = 'Wheel velocity {0} -> {1} exceeds limits of {2}'.format(strtmp, vel_dict[strtemp], self.vel_limit)
				print(err)
				rospy.loginfo(err)
				return 

		msg 		= wheel_velocity_msg()

		msg.FL_vel 	= vel_dict['FL']		# Assigns wheel angular velocities variables to msg
		msg.FR_vel 	= vel_dict['FR']
		msg.BL_vel 	= vel_dict['BL']
		msg.BR_vel 	= vel_dict['BR']

		# Finally, publish the message
		self.__set_wheel_vel(msg)
		return


	def __set_wheel_vel(self, msg):
		# Publishes message of type wheel_velocity_message to topic 'wheel_vel'
		self.wheel_vel_publisher.publish(msg)
		# self.rate.sleep()
		return


	def __set_goal_state(self, status):
		# Publishes information whether the goal has been reached
		if status:
			rospy.loginfo('Goal state reached')

		self.goal_state_publisher.publish(status)
		# self.rate.sleep()
		return


	def __correct_tilt(self):
		"""
		Function corrects for sideways movement of the vehicle to bring it into a straight line.
		Correction is applied only to the yaw of the vehicle. We want the yaw to be 0.
		Differential trust is used to steer the vehicle. 
		"""
		yaw 	= self.__state_vect['th_yaw']

		rospy.wait_for_service('pid_control')
		try:
			pid_control_proxy 	= rospy.ServiceProxy('pid_control', pid_control_req)
			resp 				= pid_control_proxy(yaw)
			vel_dict 			= {'FL':resp.FL_vel ,'FR':resp.FR_vel, 'BL':resp.BL_vel, 'BR':resp.BR_vel}
			self.__pub_wheel_vel(vel_dict)

		except rospy.ServiceException as e:
			print('Service call to /pid_control/ failed')
		return


	def __check_status(self):
		"""
		Function checks if the vehicle has ran into any problems. Some problems are:
		a) Vehicle gets stuck in the mud and does not move -> Encoder reading but no movement
		"""	
		state_vect 	= self.__state_vect
		tol 		= 0.1 	# Min speed of movement in m/s
		duration 	= 10	# Duration in seconds for tolerance	
		t1 			= time.time()

		while time.time() - t1 <= duration:
			if state_vect['vx'] >= tol:
				return True
			else:
				# Treat as stationary
				pass

		return False		# Return error


	def drill_the_bloody_hole(self,):
		# As quoted by desmond quek
		# Function drills a hole in the ground 
		print("Drilling some damn holes")
		pass


	def plant_seeds(self):
		# Function plants seeds using the dynamixel servo motor on the robot
		# Raises noSeedException
		print("Planting some seeds")

		# If there are no seeds left
		raise noSeedException("No more seeds")
		return


	def water_seeds(self):
		print("Watering the seeds")
		return


	def test_pub_wheel_vel(self, vel_dict):
		self.__pub_wheel_vel(vel_dict)
		return


	def move_to_dist(self, dist):
		"""
		Function moves the robot by a fixed distance in a straight line. Movement is done in open loop
		Yaw and pitch corrections are applied to correct for the vehicle tilt. 
		If the vehicle is tilted, we attempt to correct it back to a straight line using differential trust

		Input 	: dist - distance to travel in meters
		Output 	: goal_is_reached set as true
		"""
		if dist < 0:
			print('Distance must be positive')
			return

		rospy.loginfo('Travelling {0}m to goal'.format(dist))
		print('Travelling {0}m to goal'.format(dist))

		self.__set_goal_state(False)

		travelled 		= 0		# Straight line distance
		timestep 		= self.timestep
		tol 			= 0.5 	# m/s
		
		vel_dict 		= {'FL':100 ,'FR':100, 'BL':100, 'BR':100}
		self.__pub_wheel_vel(vel_dict)

		while travelled <= dist:
			state_vect 	= self.__state_vect

			# TODO: Have a balance between encoder and velocity readings 
			# Function uses encoder velocity readings if velocity readings are above threshold tol
			if self.__check_status():
				# If vehicle is working normally
				if state_vect['vx'] <= tol:
					vx_frame 	= state_vect['vx']
				else:
					vx_frame 	= self.__vel_encoder_avg

			else:
				# Vehicle stuck error handler.
				raise vehStuckException("Vehicle is stuck")

			vx_e		= vx_frame* math.cos(state_vect['th_pitch'])* \
						  math.cos(state_vect[th_yaw])	# vx in inertial frame

			travelled 	+= vx_e* timestep		# Update travelled distance
			self.__correct_tilt()				# Corrects vehicle tilt
			self.rate.sleep()

		rospy.loginfo('Goal reached')
		self.__set_goal_state(True)
		return


	def get_coords(self):
		# Gets the vehicles GPS coordinates ... If we have the money to buy a GPS device
		return '(100,200,300)'


	def no_seeds_error(self):
		rospy.loginfo('Vehicle error -> Out of seeds')
		print("Vehicle is out of seeds. Coordinate location: {0}. Please come and refil!".format(self.get_coords()))
		print("""
Once done, press to execute operations
r - Resume operation
e - Exit and shut down""")
		
		usr_in 	= raw_input()
		while (usr_in != 'r' and usr_in != 'e'):
			print("Invalid input. Retype: ")
			usr_in = raw_input()

		if (usr_in == 'r'):
			return

		elif(usr_in == 'e'):
			sys.exit(1)


	def veh_stuck_error(self):
		rospy.loginfo('Vehicle error -> Stuck')
		print("Vehicle is stuck. Coordinate location: {0}!".format(self.get_coords()))
		print("""
Once done, press to execute operations
r - Resume operation
e - Exit and shut down""")
		
		usr_in 	= raw_input()
		while (usr_in != 'r' and usr_in != 'e'):
			print("Invalid input. Retype: ")
			usr_in = raw_input()

		if (usr_in == 'r'):
			return

		elif(usr_in == 'e'):
			sys.exit(1)
