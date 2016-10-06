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
main_q 	= PriorityQueue()			# Initializes priority queue object
t_out 	= 1 						# seconds

priority_VHIGH 			= 1			# Categorizes a set of priority levels
priority_HIGH 			= 3
priority_MEDIUM 		= 5
priority_LOW 			= 7

plot_dist_option 		= [1,2]	
max_seed_no 			= 3


def __make_u_turn():
	main_q.put((priority_MEDIUM, time.time(), driver.make_u_turn, None))
	time.sleep(0.1)

def __plan_seed_plant_with_dist(dist):
	main_q.put((priority_MEDIUM, time.time(), driver.move_to_dist, [dist]))		# Pass arguments as list
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.delta_move_dist, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.drill_the_bloody_hole, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.delta_move_dist, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.plant_seeds, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.delta_move_dist, None))
	time.sleep(0.1)
	main_q.put((priority_MEDIUM, time.time(), driver.water_seeds, None))
	time.sleep(0.1)
	return

def initialize_queue():
	# Parses user request and loads the queue
	while not main_q.empty():
		main_q.get(timeout=t_out)

	print("Loading new queue request")
	print("\nHow many seeds do you wish to plant: ")	
	no_of_seeds 			= int(raw_input())
	
	print("\nDistance between each plant: ")	
	plot_distance 			= int(raw_input())

	assert no_of_seeds <= max_seed_no and plot_distance in plot_dist_option

	# Phase 1 : Normal operation of planting seeds 
	for _ in range(no_of_seeds):
		__plan_seed_plant_with_dist(plot_distance)

	# Phase 2 : Executes a U-turn
	__make_u_turn()
	return

def read_execute_queue():
	try:
		while not main_q.empty():
			# reads all functions in queue
			_,_,fnct,args = main_q.get(timeout=t_out)

			if args is not None:	
				fnct(*args)		# Executes function
			else:
				fnct()

			time.sleep(5)

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
	raw_input('Planning successful. Press enter to begin operation')
	read_execute_queue()
	print("Finished executing instructions. Waiting for more")
