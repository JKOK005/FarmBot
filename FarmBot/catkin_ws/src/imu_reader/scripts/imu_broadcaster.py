#!/usr/bin/python

"""
IMU broadcaster with Kalman filtering for MPU 9255 waveshare accelerometer & gyroscope. 

This script depends on the IMU_math library located in the same directory 

Main script that performs the tasks of getting the reading of the IMU and computing the resultant angle 

The Raspberry Pi will first query the IMU for the gyro readings and acceleration values.
The values are then used to determine the actual state of the system in roll / pitch / yaw 
Gyro readings are integrated across a time step based on the sampling interval of the Raspberry
Accelerometer values are transformed based on a mapping function to estimated states of the system
We then apply a Kalman filtering which tracks the system across time
The Kalman filter will have higher weightage towards the Gyro readings during the first initial time steps but this
weightage will diminish as the Gyro becomes less accurate over time

The axis of the IMU is defined as such:
Positive angles are calculated using the right hand rule 

-----------					  ^
|		  |					 / \
|		  |		  			  |	 X (roll)
|		  |				      |
| (pins)  |				<---- o  Z(out of plane - Yaw)
-----------			Y (pitch)
"""

import time
import rospy
import numpy as np 
import IMU_math as IMU

from math import pi
from imu_reader.msg import veh_state_msg		# Broadcasting veh state msg structure

class IMU_driver():
	"""
	Gimbal_driver class that the user calls to initialize all necessary threads and start the operation.

	Node 				: imu_broadcaster
	Publish topic		: 'veh_state' 
	Subscribe topic		: None
	"""
	def __init__(self, timestep=0.1):

		self.timestep 				= timestep				# Seconds
		self.freq 					= 1/timestep			# Hz

		# Global readings
		self.imu_bias 				= np.array([0,0,0,0,0,0])
		self.ang_vel_reading 		= np.array([0,0,0])		# Angular velocity reading from gyroscope in [wx, wy, wz] (rad/s)
		self.accel_reading			= np.array([0,0,0])		# Acceleration from accelerometer in [Ax, Ay, Az]
		self.true_state 			= np.array([0,0,0])		# Global true sate of gimbal after filtering (rad)
		self.P_k_k 					= [np.asmatrix(np.zeros((2,2))) for i in range(3)]		# Error covariance matrix for X / Y / Z
		
		self.veh_state_pubisher		= rospy.Publisher('veh_state', veh_state_msg)
		rospy.init_node('imu_broadcaster')
		rospy.loginfo('Starting imu_broadcaster node')
		self.rate = rospy.Rate(self.freq)	 


	def __update_imu_reading(self):
		"""
		Function will query the IMU for readings from the Gyro and Accelerometer
		This will update the imu_reading variable in the form np.array([AccX, AccY, AccZ, OmegaX, OmegaY, OmegaZ])
		IMU bias is factored in during the update process

		In turn, we update the parameters:
		ang_vel_reading -> rad / s
		accel_reading   -> m / s^2

		param: None
		rtype: None
		"""
		''' Code to poll the IMU for various readings '''

		imu_reading 			= IMU.get_IMU_reading() - self.IMU_bias
		self.ang_vel_reading 	= 2*pi*IMU_readings[:3]/ 360
		self.accel_reading 		= IMU_readings[3:]
		return


	def __update_true_state(self):
		"""
		Function performs a kalman filtering process to track the Gimbal's true state

		param: None
		rtype: None
		"""

		# Get gyro posterior state
		delta_theta 	= IMU.get_integrate_gyro(self.ang_vel_reading, self.timestep)		# get_integrate_gyro from function gyro_math.py
		gyro_state 		= self.true_state + delta_theta

		# Get accelerometer predicted state
		accel_state 	= IMU.get_state_accel(self.accel_reading)

		# Use weighted average to create an estimation of the posterior
		est_state = (0.1*gyro_state + 0.9*accel_state)							# Take the average state
		est_state[-1] *= 10                                                              # Yaw reading follows gyro

		# Kalman filtering and update of true posterior state
		x_k_k, P_update 	= self.__get_state_from_kalman(z_k=est_state, u_k=gyro_readings)			# Apply kalman filtering
		self.true_state 	= x_k_k
		self.P_k_k = P_update
		return


	def __get_state_from_kalman(self, z_k, u_k):
		""" 
        Handles the kalman filtering to obtain the true state of the gimbal 
        Reference: http://blog.tkjelectronics.dk/2012/09/a-practical-approach-to-kalman-filter-and-how-to-implement-it/

        true_state is the state of the system at time K-1
        est_state is the state of the system at time K, which is the measured state based on IMU readings

        We want to perform the filtering to get the new true_state of the system at time K

        param: 	est_state: The measured state of the system at time K
                        u_k: The measured gyro readings at time K
        """
		# IMu parameters
		R_measure 	= 0.03		# Measurement noise variance for Roll / Pitch / Yaw
		Q_angle	 	= 0.001		# Accelerometer bias in X / Y / Z
		Q_gyro	 	= 0.003		# Gyro bias in Roll / Pitch / Yaw

		# Kalman filtering parameters
		F = np.matrix([[1,-self.smpl_time],[0,1]])		# State transition matrix
		B = np.matrix([[self.smpl_time],[0]])	

		#Start Kalman filtering from here onwards
		Q_matrix 			= np.matrix([[Q_angle,0],[0,Q_gyro]])
		drift 				= self.IMU_drift_rate
		true_state_km1 		= self.true_state
		P_km1_km1 			= self.P_k_k
		
		return IMU.kalman_filter(F, B, R_measure, Q_matrix, u_k, drift, true_state_km1, z_k, P_km1_km1)


	def calibrate_bias_readings(self):
		"""
		Function ran before initialization to capture the bias of the system
		We want to sample the readings of 3DOF of acceleration and angular velocity to get their biases
		To-be-implemented: Save the current data so that the user can preload the bias without calibrating again when needed
		"""
		print("Starting to calibrate the device.")
		print("Place the FarmBot in a straight line horizontal to the ground.")
		
		for i in reversed(range(5)):
			print("Calibration begins in ... {0}".format(i +1))
			time.sleep(1)
		
		print('Calibrating ... ')

		smpl_size = 100
		slp_time = 0.01

		gyro_bias_mean_x 	= []
		gyro_bias_mean_y 	= []
		gyro_bias_mean_z 	= []
		accel_bias_mean_x	= []
		accel_bias_mean_y 	= []
		accel_bias_mean_z 	= []

		for i in range(smpl_size):
			reading = IMU.get_IMU_reading()
			gyro_bias_mean_x.append(reading[0])
			gyro_bias_mean_y.append(reading[1])
			gyro_bias_mean_z.append(reading[2])
			accel_bias_mean_x.append(reading[3])
			accel_bias_mean_y.append(reading[4])
			accel_bias_mean_z.append(reading[5] -1)		# Z is by default supposed to be 1
			time.sleep(slp_time)

		gyro_drift_rate_x 	= (gyro_bias_mean_x[-1] - gyro_bias_mean_x[0]) / (slp_time*smpl_size)    # Mean rate of drift in deg s^-2
		gyro_drift_rate_y 	= (gyro_bias_mean_y[-1] - gyro_bias_mean_y[0]) / (slp_time*smpl_size)
		gyro_drift_rate_z 	= (gyro_bias_mean_z[-1] - gyro_bias_mean_z[0]) / (slp_time*smpl_size)

		gyro_bias_x 	= np.mean(gyro_bias_mean_x)             # Calculates the mean bias after removal of drift 
		gyro_bias_y 	= np.mean(gyro_bias_mean_y)
		gyro_bias_z 	= np.mean(gyro_bias_mean_z)
		accel_bias_x 	= np.mean(accel_bias_mean_x)
		accel_bias_y 	= np.mean(accel_bias_mean_y)
		accel_bias_z 	= np.mean(accel_bias_mean_z)

		self.IMU_bias = np.array([gyro_bias_x, gyro_bias_y, gyro_bias_z, accel_bias_x, accel_bias_y, accel_bias_z])
		self.IMU_drift_rate = np.array([gyro_drift_rate_x, gyro_drift_rate_y, gyro_drift_rate_z])
		print("calibration complete. Operation start!")
		return


	def spin_publish_tilt(self):
		"""
		Gets the tilt angle of the vehicle by performing IMU acquisition and kalman filtering
		Thereafter, publish angle and velocity readings to topic "veh_state"
		"""
		while not rospy.is_shutdown():
			self.__update_imu_reading()			# Gets IMU reading
			self.__update_true_state()			# Performs Kalman filtering

			msg 			= veh_state_msg()
			msg.vx			= self.accel_reading[0] *self.timestep
			msg.vy 			= self.accel_reading[1] *self.timestep
			msg.th_roll		= self.true_state[0]
			msg.th_pitch	= self.true_state[1]
			msg.th_yaw		= self.true_state[2]

			self.veh_state_pubisher.publish(msg)
			self.rate.sleep()


if __name__ == "__main__":
	try:
		imu_obj 	= IMU_driver()
		imu_obj.calibrate_bias_readings()	# Performs initial calibration of IMU for bias readings
		imu_obj.spin_publish_tilt()

	except rospy.ROSInterruptException:
		rospy.loginfo('imu_broadcaster failed to initialize')
		pass
