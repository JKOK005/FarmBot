#!/usr/bin/python

"""
Main script for actual Farm Bot operations
"""

import time
import rospy
from bot_driver import farmBotDriver
from bot_driver import noSeedException, vehStuckException
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
	main_q.put((priority_MEDIUM, time.time(), driver.move_to_dist, [2]))		# Pass arguments as list
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.drill_the_bloody_hole, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.plant_seeds, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.water_seeds, None))
	time.sleep(0.1)

	main_q.put((priority_MEDIUM, time.time(), driver.move_to_dist, [1]))		# Pass arguments as list
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.drill_the_bloody_hole, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.plant_seeds, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.water_seeds, None))
	time.sleep(0.1)

	main_q.put((priority_MEDIUM, time.time(), driver.move_to_dist, [3]))		# Pass arguments as list
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.drill_the_bloody_hole, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.plant_seeds, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.water_seeds, None))
	time.sleep(0.1)


def read_execute_queue():
	try:
		while not main_q.empty():
			# reads all functions in queue
			_,_,fnct,args = main_q.get(timeout=t_out)

			if args is not None:	
				fnct(*args)		# Executes function
			else:
				fnct()
		time.sleep(1)

	except noSeedException:
		# Raises empty seed dispenser to system
		main_q.put((priority_VHIGH, time.time(), driver.no_seeds_error, None))	# Throws an error handling function with very high priority into queue
		time.sleep(0.1)
		main_q.put((priority_VHIGH, time.time(), driver.plant_seeds, None))		# Reinstates plant seeds into queue
		time.sleep(0.1)
		read_execute_queue()

	except vehStuckException:
		# Handle stuck vehicle exception
		main_q.put((priority_VHIGH, time.time(), driver.veh_stuck_error, None))	# Throws an error handling function with very high priority into queue
		time.sleep(0.1)
		read_execute_queue()

	except Exception as e:
		# Handles all other exceptions 
		print(e)


if __name__ == "__main__": 
	rospy.init_node('Farm_Bot_driver', anonymous=True, log_level=rospy.INFO)
	initialize_queue()
	raw_input('Press enter to begin operation')
	read_execute_queue()
	print("Finished executing instructions. Waiting for more")
