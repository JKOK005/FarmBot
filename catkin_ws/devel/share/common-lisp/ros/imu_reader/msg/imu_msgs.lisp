; Auto-generated. Do not edit!


(cl:in-package imu_reader-msg)


;//! \htmlinclude imu_msgs.msg.html

(cl:defclass <imu_msgs> (roslisp-msg-protocol:ros-message)
  ((acc_x
    :reader acc_x
    :initarg :acc_x
    :type cl:float
    :initform 0.0)
   (acc_y
    :reader acc_y
    :initarg :acc_y
    :type cl:float
    :initform 0.0)
   (ang_roll
    :reader ang_roll
    :initarg :ang_roll
    :type cl:float
    :initform 0.0)
   (ang_pitch
    :reader ang_pitch
    :initarg :ang_pitch
    :type cl:float
    :initform 0.0)
   (ang_yaw
    :reader ang_yaw
    :initarg :ang_yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass imu_msgs (<imu_msgs>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <imu_msgs>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'imu_msgs)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_reader-msg:<imu_msgs> is deprecated: use imu_reader-msg:imu_msgs instead.")))

(cl:ensure-generic-function 'acc_x-val :lambda-list '(m))
(cl:defmethod acc_x-val ((m <imu_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:acc_x-val is deprecated.  Use imu_reader-msg:acc_x instead.")
  (acc_x m))

(cl:ensure-generic-function 'acc_y-val :lambda-list '(m))
(cl:defmethod acc_y-val ((m <imu_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:acc_y-val is deprecated.  Use imu_reader-msg:acc_y instead.")
  (acc_y m))

(cl:ensure-generic-function 'ang_roll-val :lambda-list '(m))
(cl:defmethod ang_roll-val ((m <imu_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:ang_roll-val is deprecated.  Use imu_reader-msg:ang_roll instead.")
  (ang_roll m))

(cl:ensure-generic-function 'ang_pitch-val :lambda-list '(m))
(cl:defmethod ang_pitch-val ((m <imu_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:ang_pitch-val is deprecated.  Use imu_reader-msg:ang_pitch instead.")
  (ang_pitch m))

(cl:ensure-generic-function 'ang_yaw-val :lambda-list '(m))
(cl:defmethod ang_yaw-val ((m <imu_msgs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:ang_yaw-val is deprecated.  Use imu_reader-msg:ang_yaw instead.")
  (ang_yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <imu_msgs>) ostream)
  "Serializes a message object of type '<imu_msgs>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acc_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ang_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ang_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ang_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <imu_msgs>) istream)
  "Deserializes a message object of type '<imu_msgs>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acc_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ang_roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ang_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ang_yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<imu_msgs>)))
  "Returns string type for a message object of type '<imu_msgs>"
  "imu_reader/imu_msgs")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'imu_msgs)))
  "Returns string type for a message object of type 'imu_msgs"
  "imu_reader/imu_msgs")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<imu_msgs>)))
  "Returns md5sum for a message object of type '<imu_msgs>"
  "cd2c1f924dbee441b71bff2bd002151e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'imu_msgs)))
  "Returns md5sum for a message object of type 'imu_msgs"
  "cd2c1f924dbee441b71bff2bd002151e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<imu_msgs>)))
  "Returns full string definition for message of type '<imu_msgs>"
  (cl:format cl:nil "# Message structure for IMU reading~%~%float32  acc_x~%float32	 acc_y~%float32	 ang_roll~%float32	 ang_pitch~%float32  ang_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'imu_msgs)))
  "Returns full string definition for message of type 'imu_msgs"
  (cl:format cl:nil "# Message structure for IMU reading~%~%float32  acc_x~%float32	 acc_y~%float32	 ang_roll~%float32	 ang_pitch~%float32  ang_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <imu_msgs>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <imu_msgs>))
  "Converts a ROS message object to a list"
  (cl:list 'imu_msgs
    (cl:cons ':acc_x (acc_x msg))
    (cl:cons ':acc_y (acc_y msg))
    (cl:cons ':ang_roll (ang_roll msg))
    (cl:cons ':ang_pitch (ang_pitch msg))
    (cl:cons ':ang_yaw (ang_yaw msg))
))
