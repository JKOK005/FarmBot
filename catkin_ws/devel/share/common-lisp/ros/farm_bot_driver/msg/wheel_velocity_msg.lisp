; Auto-generated. Do not edit!


(cl:in-package farm_bot_driver-msg)


;//! \htmlinclude wheel_velocity_msg.msg.html

(cl:defclass <wheel_velocity_msg> (roslisp-msg-protocol:ros-message)
  ((FR_vel
    :reader FR_vel
    :initarg :FR_vel
    :type cl:integer
    :initform 0)
   (FL_vel
    :reader FL_vel
    :initarg :FL_vel
    :type cl:integer
    :initform 0)
   (BR_vel
    :reader BR_vel
    :initarg :BR_vel
    :type cl:integer
    :initform 0)
   (BL_vel
    :reader BL_vel
    :initarg :BL_vel
    :type cl:integer
    :initform 0))
)

(cl:defclass wheel_velocity_msg (<wheel_velocity_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <wheel_velocity_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'wheel_velocity_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name farm_bot_driver-msg:<wheel_velocity_msg> is deprecated: use farm_bot_driver-msg:wheel_velocity_msg instead.")))

(cl:ensure-generic-function 'FR_vel-val :lambda-list '(m))
(cl:defmethod FR_vel-val ((m <wheel_velocity_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader farm_bot_driver-msg:FR_vel-val is deprecated.  Use farm_bot_driver-msg:FR_vel instead.")
  (FR_vel m))

(cl:ensure-generic-function 'FL_vel-val :lambda-list '(m))
(cl:defmethod FL_vel-val ((m <wheel_velocity_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader farm_bot_driver-msg:FL_vel-val is deprecated.  Use farm_bot_driver-msg:FL_vel instead.")
  (FL_vel m))

(cl:ensure-generic-function 'BR_vel-val :lambda-list '(m))
(cl:defmethod BR_vel-val ((m <wheel_velocity_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader farm_bot_driver-msg:BR_vel-val is deprecated.  Use farm_bot_driver-msg:BR_vel instead.")
  (BR_vel m))

(cl:ensure-generic-function 'BL_vel-val :lambda-list '(m))
(cl:defmethod BL_vel-val ((m <wheel_velocity_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader farm_bot_driver-msg:BL_vel-val is deprecated.  Use farm_bot_driver-msg:BL_vel instead.")
  (BL_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <wheel_velocity_msg>) ostream)
  "Serializes a message object of type '<wheel_velocity_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'FR_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'FR_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'FR_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'FR_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'FL_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'FL_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'FL_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'FL_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BR_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'BR_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'BR_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'BR_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BL_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'BL_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'BL_vel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'BL_vel)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <wheel_velocity_msg>) istream)
  "Deserializes a message object of type '<wheel_velocity_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'FR_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'FR_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'FR_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'FR_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'FL_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'FL_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'FL_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'FL_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BR_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'BR_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'BR_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'BR_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'BL_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'BL_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'BL_vel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'BL_vel)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<wheel_velocity_msg>)))
  "Returns string type for a message object of type '<wheel_velocity_msg>"
  "farm_bot_driver/wheel_velocity_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'wheel_velocity_msg)))
  "Returns string type for a message object of type 'wheel_velocity_msg"
  "farm_bot_driver/wheel_velocity_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<wheel_velocity_msg>)))
  "Returns md5sum for a message object of type '<wheel_velocity_msg>"
  "329705fbf5edc3538e8d30fb491f55ed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'wheel_velocity_msg)))
  "Returns md5sum for a message object of type 'wheel_velocity_msg"
  "329705fbf5edc3538e8d30fb491f55ed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<wheel_velocity_msg>)))
  "Returns full string definition for message of type '<wheel_velocity_msg>"
  (cl:format cl:nil "# Message structure for wheel angular velocities for Dynamixel series AX~%# FR - Front right / FL - Front left / BR - Back right / BL - Back left~%# Each wheel can only have positive angular velocities~%~%uint32 FR_vel~%uint32 FL_vel~%uint32 BR_vel~%uint32 BL_vel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'wheel_velocity_msg)))
  "Returns full string definition for message of type 'wheel_velocity_msg"
  (cl:format cl:nil "# Message structure for wheel angular velocities for Dynamixel series AX~%# FR - Front right / FL - Front left / BR - Back right / BL - Back left~%# Each wheel can only have positive angular velocities~%~%uint32 FR_vel~%uint32 FL_vel~%uint32 BR_vel~%uint32 BL_vel~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <wheel_velocity_msg>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <wheel_velocity_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'wheel_velocity_msg
    (cl:cons ':FR_vel (FR_vel msg))
    (cl:cons ':FL_vel (FL_vel msg))
    (cl:cons ':BR_vel (BR_vel msg))
    (cl:cons ':BL_vel (BL_vel msg))
))
