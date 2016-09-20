# FarmBot

In this project, we aim to create a seed germination robot with a mobile base. The robot has a few functionalities. It first navigates
to an empty plot of land, drills a hole, releases seeds and then waters the seeds before moving on to the next empty plot. 

This project was built using ROS as the software framework for message passing. For the hardware, we are using the Raspberry Pi 3 and Arduino
to perform the high and lower level logic handling. The Raspberry Pi 3 implements a Priority Queue structure to handle the instructions to 
plant seeds and manage any system errors that might happen along the way. It also interfaces with the MPU 9255 accelerometer and gyroscope unit.
The arduino interfaces with the Dynamixel Ax-12 model that controls the steering of the robot. 

... More to be added once the project is completed
