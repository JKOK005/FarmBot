#!/usr/bin/env python

"""
Ros service for PID request. 
We want to keep the vehicle moving in a straight line. If yaw is not zero, we apply correction to
steer the vehicle right or left.

Input : Yaw angle as int
Output : Wheel velocities 
Params : P / I / D constants for control
"""

import rospy
import time
from imu_reader.srv import pid_control_req

def handle_pid_control_req(req):
	print("Returning PID request")

	# Assume that the request comes in as a yaw input
	yaw  			= req.yaw

	# Calvin add your PID code here
	yaw_old = req.yaw_old#input previous yaw error from this function
	base_vel = req.vel#input base velocity from user

	t= 0.01#include timestep

	Kp=1
	Kd=1
	Ki=1

	param_vel_motor= Kp*yaw + Kd*(yaw-yaw_old)/t + Ki * yaw * t

	resp 			= pid_control_reqResponse()
	resp.FL_vel 	= (1-param_vel_motor) * base_vel 
	resp.FR_vel 	= (1-param_vel_motor) * base_vel
	resp.BL_vel 	= (1+param_vel_motor) * base_vel
	resp.BR_vel 	= (1+param_vel_motor) * base_vel 

	req.yaw_old = yaw

	return resp


def pid_control_server():
	rospy.init_node('pid_control_node')
	srv = rospy.Service('pid_control', pid_control_req, handle_pid_control_req)
	print('Ready to process incoming PID requests')
	rospy.spin()

if __name__ == "__main__":
	pid_control_server()