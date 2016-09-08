""" FarmBot API with support from ROS. FarmBot is a robot that travels autonomously across soil and plants different types of seeds.
The Bot will water each seed after depositing it for the first time. The Bot is not made to perform watering tasks. 
Tracking of the Bot is done using encoder readings and accelerometer readings. 
The Bot is driven by a 4 wheeled drive using 4 dynamixel motors at each wheel. Differential trust is used to steer the Bot
left or right. The wheels are controlled by the Arudino unit at the base which subscribes to a ROS topic that listens to wheel 
velocities. At the head, the Raspberry Pi (model 3) performs computation on tilt angles and publishes goal state and wheel velocities.
This Python script resides in the farm_bot_driver package 
Tutorial:
"""

import rospy
import math
import numpy as np
import os
import sys
import datetime 
from std_msgs.msg import Bool
from farm_bot_driver.msg import wheel_velocity_message

class farmBotDriver:
	# Main controller for FarmBot
	def __init__(self):
		self.vel_limit 				= 100		# Each wheel can only have a max angular velocity starting from 0
		self.goal_state_publisher 	= rospy.Publisher('goal_state', Bool)
		self.wheel_vel_publisher 	= rospy.Publisher('wheel_vel', wheel_velocity_message)
		self.rate 					= rospy.Rate(10)	# 10 Hz 
		date_time 					= datetime.datetime.now()

		rospy.init_node('Farm_Bot_driver', anonymous=True, log_level=rospy.WARN)
		rospy.loginfo(rospy.get_caller_id() + '-> Starting farm bot operation at -> ' + date_time.isoformat())
	

	def pub_wheel_vel(self, vel_dict):
		"""
		Function publishes desired wheel velocities as given in vel_dict to the 'wheel_vel' topic

		Input : vel_dict is of type dict with keys {'FR' , 'FL' , 'BR' , 'BL'}
		"""
		key_str 	= ['FL' , 'FR' , 'BL' , 'BR']

		for strtemp in key_str:
			try:
				# Asserts velocities are within angular velocity limited range
				assert (vel_dict[strtemp] <= self.vel_limit and vel_dict >= 0)

			except AssertionError:
				err = 'Wheel velocity {0} -> {1} exceeds limits of {2}'.format(strtmp, vel_dict[strtemp], self.vel_limit)
				print(err)
				rospy.loginfo(err)
				return 

		msg 		= wheel_velocity_message()

		msg.FL_vel = vel_dict['FL']		# Assigns wheel angular velocities variables to msg
		msg.FR_vel = vel_dict['FR']
		msg.BL_vel = vel_dict['BL']
		msg.BR_vel = vel_dict['BR']

		# Finally, publish the message
		self.__set_wheel_vel(msg)
		return

	def __set_wheel_vel(self, msg):
		# Publishes message of type wheel_velocity_message to topic 'wheel_vel'
		self.wheel_vel_publisher.publish(msg)
		self.rate.sleep()
		return