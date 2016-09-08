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
from std_msgs.msgs import Bool

class farmBotDriver:
	# Main controller for FarmBot
	def __init__(self):
		self.set_goal_state 	= rospy.Publisher('goal_state', Bool)
		self.set_wheel_vel 		= rospy.Publisher('wheel_vel', )
		date_time 				= datetime.datetime.now()

		rospy.init_node('Farm_Bot_driver', anonymous=True, log_level=rospy.WARN)
		rospy.loginfo(rospy.get_caller_id() + '-> Starting farm bot operation at -> ' + date_time.isoformat())