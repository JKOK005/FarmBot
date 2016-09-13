; Auto-generated. Do not edit!


(cl:in-package imu_reader-srv)


;//! \htmlinclude pid_control_req-request.msg.html

(cl:defclass <pid_control_req-request> (roslisp-msg-protocol:ros-message)
  ((yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass pid_control_req-request (<pid_control_req-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pid_control_req-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pid_control_req-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_reader-srv:<pid_control_req-request> is deprecated: use imu_reader-srv:pid_control_req-request instead.")))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <pid_control_req-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-srv:yaw-val is deprecated.  Use imu_reader-srv:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pid_control_req-request>) ostream)
  "Serializes a message object of type '<pid_control_req-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pid_control_req-request>) istream)
  "Deserializes a message object of type '<pid_control_req-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pid_control_req-request>)))
  "Returns string type for a service object of type '<pid_control_req-request>"
  "imu_reader/pid_control_reqRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pid_control_req-request)))
  "Returns string type for a service object of type 'pid_control_req-request"
  "imu_reader/pid_control_reqRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pid_control_req-request>)))
  "Returns md5sum for a message object of type '<pid_control_req-request>"
  "e3f3937906a511b0cf091d670e4b7a78")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pid_control_req-request)))
  "Returns md5sum for a message object of type 'pid_control_req-request"
  "e3f3937906a511b0cf091d670e4b7a78")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pid_control_req-request>)))
  "Returns full string definition for message of type '<pid_control_req-request>"
  (cl:format cl:nil "~%~%~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pid_control_req-request)))
  "Returns full string definition for message of type 'pid_control_req-request"
  (cl:format cl:nil "~%~%~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pid_control_req-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pid_control_req-request>))
  "Converts a ROS message object to a list"
  (cl:list 'pid_control_req-request
    (cl:cons ':yaw (yaw msg))
))
;//! \htmlinclude pid_control_req-response.msg.html

(cl:defclass <pid_control_req-response> (roslisp-msg-protocol:ros-message)
  ((FL_vel
    :reader FL_vel
    :initarg :FL_vel
    :type cl:integer
    :initform 0)
   (FR_vel
    :reader FR_vel
    :initarg :FR_vel
    :type cl:integer
    :initform 0)
   (BL_vel
    :reader BL_vel
    :initarg :BL_vel
    :type cl:integer
    :initform 0)
   (BR_vel
    :reader BR_vel
    :initarg :BR_vel
    :type cl:integer
    :initform 0))
)

(cl:defclass pid_control_req-response (<pid_control_req-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pid_control_req-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pid_control_req-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_reader-srv:<pid_control_req-response> is deprecated: use imu_reader-srv:pid_control_req-response instead.")))

(cl:ensure-generic-function 'FL_vel-val :lambda-list '(m))
(cl:defmethod FL_vel-val ((m <pid_control_req-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-srv:FL_vel-val is deprecated.  Use imu_reader-srv:FL_vel instead.")
  (FL_vel m))

(cl:ensure-generic-function 'FR_vel-val :lambda-list '(m))
(cl:defmethod FR_vel-val ((m <pid_control_req-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-srv:FR_vel-val is deprecated.  Use imu_reader-srv:FR_vel instead.")
  (FR_vel m))

(cl:ensure-generic-function 'BL_vel-val :lambda-list '(m))
(cl:defmethod BL_vel-val ((m <pid_control_req-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-srv:BL_vel-val is deprecated.  Use imu_reader-srv:BL_vel instead.")
  (BL_vel m))

(cl:ensure-generic-function 'BR_vel-val :lambda-list '(m))
(cl:defmethod BR_vel-val ((m <pid_control_req-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_reader-srv:BR_vel-val is deprecated.  Use imu_reader-srv:BR_vel instead.")
  (BR_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pid_control_req-response>) ostream)
  "Serializes a message object of type '<pid_control_req-response>"
  (cl:let* ((signed (cl:slot-value msg 'FL_vel)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'FR_vel)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'BL_vel)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'BR_vel)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pid_control_req-response>) istream)
  "Deserializes a message object of type '<pid_control_req-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'FL_vel) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'FR_vel) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'BL_vel) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'BR_vel) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pid_control_req-response>)))
  "Returns string type for a service object of type '<pid_control_req-response>"
  "imu_reader/pid_control_reqResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pid_control_req-response)))
  "Returns string type for a service object of type 'pid_control_req-response"
  "imu_reader/pid_control_reqResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pid_control_req-response>)))
  "Returns md5sum for a message object of type '<pid_control_req-response>"
  "e3f3937906a511b0cf091d670e4b7a78")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pid_control_req-response)))
  "Returns md5sum for a message object of type 'pid_control_req-response"
  "e3f3937906a511b0cf091d670e4b7a78")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pid_control_req-response>)))
  "Returns full string definition for message of type '<pid_control_req-response>"
  (cl:format cl:nil "~%~%int32  FL_vel~%int32  FR_vel~%int32  BL_vel~%int32  BR_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pid_control_req-response)))
  "Returns full string definition for message of type 'pid_control_req-response"
  (cl:format cl:nil "~%~%int32  FL_vel~%int32  FR_vel~%int32  BL_vel~%int32  BR_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pid_control_req-response>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pid_control_req-response>))
  "Converts a ROS message object to a list"
  (cl:list 'pid_control_req-response
    (cl:cons ':FL_vel (FL_vel msg))
    (cl:cons ':FR_vel (FR_vel msg))
    (cl:cons ':BL_vel (BL_vel msg))
    (cl:cons ':BR_vel (BR_vel msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'pid_control_req)))
  'pid_control_req-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'pid_control_req)))
  'pid_control_req-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pid_control_req)))
  "Returns string type for a service object of type '<pid_control_req>"
  "imu_reader/pid_control_req")