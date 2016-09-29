; Auto-generated. Do not edit!


(cl:in-package arduino_driver-msg)


;//! \htmlinclude encoder_vel_msg.msg.html

(cl:defclass <encoder_vel_msg> (roslisp-msg-protocol:ros-message)
  ((v_FL
    :reader v_FL
    :initarg :v_FL
    :type cl:float
    :initform 0.0)
   (v_FR
    :reader v_FR
    :initarg :v_FR
    :type cl:float
    :initform 0.0)
   (v_BL
    :reader v_BL
    :initarg :v_BL
    :type cl:float
    :initform 0.0)
   (v_BR
    :reader v_BR
    :initarg :v_BR
    :type cl:float
    :initform 0.0))
)

(cl:defclass encoder_vel_msg (<encoder_vel_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <encoder_vel_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'encoder_vel_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arduino_driver-msg:<encoder_vel_msg> is deprecated: use arduino_driver-msg:encoder_vel_msg instead.")))

(cl:ensure-generic-function 'v_FL-val :lambda-list '(m))
(cl:defmethod v_FL-val ((m <encoder_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino_driver-msg:v_FL-val is deprecated.  Use arduino_driver-msg:v_FL instead.")
  (v_FL m))

(cl:ensure-generic-function 'v_FR-val :lambda-list '(m))
(cl:defmethod v_FR-val ((m <encoder_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino_driver-msg:v_FR-val is deprecated.  Use arduino_driver-msg:v_FR instead.")
  (v_FR m))

(cl:ensure-generic-function 'v_BL-val :lambda-list '(m))
(cl:defmethod v_BL-val ((m <encoder_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino_driver-msg:v_BL-val is deprecated.  Use arduino_driver-msg:v_BL instead.")
  (v_BL m))

(cl:ensure-generic-function 'v_BR-val :lambda-list '(m))
(cl:defmethod v_BR-val ((m <encoder_vel_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino_driver-msg:v_BR-val is deprecated.  Use arduino_driver-msg:v_BR instead.")
  (v_BR m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <encoder_vel_msg>) ostream)
  "Serializes a message object of type '<encoder_vel_msg>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_FL))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_FR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_BL))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v_BR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <encoder_vel_msg>) istream)
  "Deserializes a message object of type '<encoder_vel_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_FL) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_FR) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_BL) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v_BR) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<encoder_vel_msg>)))
  "Returns string type for a message object of type '<encoder_vel_msg>"
  "arduino_driver/encoder_vel_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'encoder_vel_msg)))
  "Returns string type for a message object of type 'encoder_vel_msg"
  "arduino_driver/encoder_vel_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<encoder_vel_msg>)))
  "Returns md5sum for a message object of type '<encoder_vel_msg>"
  "be2929595248f844b23cba7dd4647f3c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'encoder_vel_msg)))
  "Returns md5sum for a message object of type 'encoder_vel_msg"
  "be2929595248f844b23cba7dd4647f3c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<encoder_vel_msg>)))
  "Returns full string definition for message of type '<encoder_vel_msg>"
  (cl:format cl:nil "# Message structure for Encoder velocities ~%# FL - Front left, FR - Front right, BL - Back left, BR - Back right~%~%float32	 v_FL	~%float32	 v_FR~%float32  v_BL~%float32  v_BR~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'encoder_vel_msg)))
  "Returns full string definition for message of type 'encoder_vel_msg"
  (cl:format cl:nil "# Message structure for Encoder velocities ~%# FL - Front left, FR - Front right, BL - Back left, BR - Back right~%~%float32	 v_FL	~%float32	 v_FR~%float32  v_BL~%float32  v_BR~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <encoder_vel_msg>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <encoder_vel_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'encoder_vel_msg
    (cl:cons ':v_FL (v_FL msg))
    (cl:cons ':v_FR (v_FR msg))
    (cl:cons ':v_BL (v_BL msg))
    (cl:cons ':v_BR (v_BR msg))
))
