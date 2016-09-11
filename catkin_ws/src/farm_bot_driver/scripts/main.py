"""
Main script for actual Farm Bot operations
"""

import time
import rospy
from bot_driver import farmBotDriver
from Queue import *

driver 	= farmBotDriver(name='Farmy Bot', timestep=0.1)
main_q 	= PriorityQueue()		# Initializes priority queue object
t_out 	= 1 	# seconds

priority_VHIGH 		= 1			# Categorizes a set of priority levels
priority_HIGH 		= 3
priority_MEDIUM 	= 5
priority_LOW 		= 7


def initialize_queue():
	# Parses user request and loads the queue
	while not main_q.empty():
		main_q.get(timeout=t_out)

	print("Loading new queue request")
	rospy.loginfo("Loading new queue request")

	# To process and update the queue here
	main_q.put((priority_MEDIUM, driver.move_to_dist, [1]))		# Pass arguments as list
	main_q.put((priority_MEDIUM, driver.drill_the_bloody_hole, None))
	main_q.put((priority_MEDIUM, driver.plant_seeds, None))
	main_q.put((priority_MEDIUM, driver.water_seeds, None))


def read_execute_queue():
	try:
		while not main_q.empty():
			# reads all functions in queue
			if args is not None:
				_,fnct,args = main_q.get(timeout=t_out)
				fnct(*args)		# Executes function
			else:
				fnct()

	except Exception as e:
		main_q.put((priority_VHIGH, driver.no_seeds_error, None))	# Throws an error handling function with very high priority into queue
	return


if __name__ == "__main__": 
	rospy.init_node('main_controls', anonymous=True, log_level=rospy.INFO)
	initialize_queue()

	while True:
		read_execute_queue()
