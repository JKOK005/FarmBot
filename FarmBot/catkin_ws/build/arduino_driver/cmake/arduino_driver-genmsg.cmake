# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "arduino_driver: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iarduino_driver:/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg;-Istd_msgs:/opt/ros/jade/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(arduino_driver_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg" NAME_WE)
add_custom_target(_arduino_driver_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "arduino_driver" "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(arduino_driver
  "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arduino_driver
)

### Generating Services

### Generating Module File
_generate_module_cpp(arduino_driver
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arduino_driver
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(arduino_driver_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(arduino_driver_generate_messages arduino_driver_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg" NAME_WE)
add_dependencies(arduino_driver_generate_messages_cpp _arduino_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arduino_driver_gencpp)
add_dependencies(arduino_driver_gencpp arduino_driver_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arduino_driver_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(arduino_driver
  "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/arduino_driver
)

### Generating Services

### Generating Module File
_generate_module_eus(arduino_driver
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/arduino_driver
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(arduino_driver_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(arduino_driver_generate_messages arduino_driver_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg" NAME_WE)
add_dependencies(arduino_driver_generate_messages_eus _arduino_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arduino_driver_geneus)
add_dependencies(arduino_driver_geneus arduino_driver_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arduino_driver_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(arduino_driver
  "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arduino_driver
)

### Generating Services

### Generating Module File
_generate_module_lisp(arduino_driver
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arduino_driver
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(arduino_driver_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(arduino_driver_generate_messages arduino_driver_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg" NAME_WE)
add_dependencies(arduino_driver_generate_messages_lisp _arduino_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arduino_driver_genlisp)
add_dependencies(arduino_driver_genlisp arduino_driver_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arduino_driver_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(arduino_driver
  "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arduino_driver
)

### Generating Services

### Generating Module File
_generate_module_py(arduino_driver
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arduino_driver
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(arduino_driver_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(arduino_driver_generate_messages arduino_driver_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jo/farm_bot_workspace/catkin_ws/src/arduino_driver/msg/encoder_vel_msg.msg" NAME_WE)
add_dependencies(arduino_driver_generate_messages_py _arduino_driver_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(arduino_driver_genpy)
add_dependencies(arduino_driver_genpy arduino_driver_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS arduino_driver_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arduino_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/arduino_driver
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(arduino_driver_generate_messages_cpp std_msgs_generate_messages_cpp)

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/arduino_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/arduino_driver
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
add_dependencies(arduino_driver_generate_messages_eus std_msgs_generate_messages_eus)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arduino_driver)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/arduino_driver
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(arduino_driver_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arduino_driver)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arduino_driver\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/arduino_driver
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(arduino_driver_generate_messages_py std_msgs_generate_messages_py)
