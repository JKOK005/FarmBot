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
from imu_reader.srv import pid_control_req

def handle_pid_control_req(req):
	print("Returning PID request")
	return


def pid_control_server():
	rospy.init_node('pid_control_node')
	srv = rospy.Service('pid_control', pid_control_req, handle_pid_control_req)
	print('Ready to process incoming PID requests')
	rospy.spin()

if __name__ == "__main__":
	pid_control_server()