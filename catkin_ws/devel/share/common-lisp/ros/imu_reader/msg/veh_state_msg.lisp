; Auto-generated. Do not edit!


(cl:in-package imu_reader-msg)


;//! \htmlinclude veh_state_msg.msg.html

(cl:defclass <veh_state_msg> (roslisp-msg-protocol:ros-message)
  ((vx
    :reader vx
    :initarg :vx
    :type cl:float
    :initform 0.0)
   (vy
    :reader vy
    :initarg :vy
    :type cl:float
    :initform 0.0)
   (th_roll
    :reader th_roll
    :initarg :th_roll
    :type cl:float
    :initform 0.0)
   (th_pitch
    :reader th_pitch
    :initarg :th_pitch
    :type cl:float
    :initform 0.0)
   (th_yaw
    :reader th_yaw
    :initarg :th_yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass veh_state_msg (<veh_state_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <veh_state_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'veh_state_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_reader-msg:<veh_state_msg> is deprecated: use imu_reader-msg:veh_state_msg instead.")))

(cl:ensure-generic-function 'vx-val :lambda-list '(m))
(cl:defmethod vx-val ((m <veh_state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:vx-val is deprecated.  Use imu_reader-msg:vx instead.")
  (vx m))

(cl:ensure-generic-function 'vy-val :lambda-list '(m))
(cl:defmethod vy-val ((m <veh_state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:vy-val is deprecated.  Use imu_reader-msg:vy instead.")
  (vy m))

(cl:ensure-generic-function 'th_roll-val :lambda-list '(m))
(cl:defmethod th_roll-val ((m <veh_state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:th_roll-val is deprecated.  Use imu_reader-msg:th_roll instead.")
  (th_roll m))

(cl:ensure-generic-function 'th_pitch-val :lambda-list '(m))
(cl:defmethod th_pitch-val ((m <veh_state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:th_pitch-val is deprecated.  Use imu_reader-msg:th_pitch instead.")
  (th_pitch m))

(cl:ensure-generic-function 'th_yaw-val :lambda-list '(m))
(cl:defmethod th_yaw-val ((m <veh_state_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-msg:th_yaw-val is deprecated.  Use imu_reader-msg:th_yaw instead.")
  (th_yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <veh_state_msg>) ostream)
  "Serializes a message object of type '<veh_state_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'th_roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'th_pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'th_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <veh_state_msg>) istream)
  "Deserializes a message object of type '<veh_state_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'th_roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'th_pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'th_yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<veh_state_msg>)))
  "Returns string type for a message object of type '<veh_state_msg>"
  "imu_reader/veh_state_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'veh_state_msg)))
  "Returns string type for a message object of type 'veh_state_msg"
  "imu_reader/veh_state_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<veh_state_msg>)))
  "Returns md5sum for a message object of type '<veh_state_msg>"
  "255b57f2bfaeefe2dc3f6cf83cc6204e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'veh_state_msg)))
  "Returns md5sum for a message object of type 'veh_state_msg"
  "255b57f2bfaeefe2dc3f6cf83cc6204e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<veh_state_msg>)))
  "Returns full string definition for message of type '<veh_state_msg>"
  (cl:format cl:nil "# Message structure for vehicle state~%~%float32  vx~%float32	 vy~%float32	 th_roll~%float32	 th_pitch~%float32  th_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'veh_state_msg)))
  "Returns full string definition for message of type 'veh_state_msg"
  (cl:format cl:nil "# Message structure for vehicle state~%~%float32  vx~%float32	 vy~%float32	 th_roll~%float32	 th_pitch~%float32  th_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <veh_state_msg>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <veh_state_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'veh_state_msg
    (cl:cons ':vx (vx msg))
    (cl:cons ':vy (vy msg))
    (cl:cons ':th_roll (th_roll msg))
    (cl:cons ':th_pitch (th_pitch msg))
    (cl:cons ':th_yaw (th_yaw msg))
))
