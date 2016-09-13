;; Auto-generated. Do not edit!


(when (boundp 'imu_reader::pid_control_req)
  (if (not (find-package "IMU_READER"))
    (make-package "IMU_READER"))
  (shadow 'pid_control_req (find-package "IMU_READER")))
(unless (find-package "IMU_READER::PID_CONTROL_REQ")
  (make-package "IMU_READER::PID_CONTROL_REQ"))
(unless (find-package "IMU_READER::PID_CONTROL_REQREQUEST")
  (make-package "IMU_READER::PID_CONTROL_REQREQUEST"))
(unless (find-package "IMU_READER::PID_CONTROL_REQRESPONSE")
  (make-package "IMU_READER::PID_CONTROL_REQRESPONSE"))

(in-package "ROS")





(defclass imu_reader::pid_control_reqRequest
  :super ros::object
  :slots (_yaw ))

(defmethod imu_reader::pid_control_reqRequest
  (:init
   (&key
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _yaw (float __yaw))
   self)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass imu_reader::pid_control_reqResponse
  :super ros::object
  :slots (_FL_vel _FR_vel _BL_vel _BR_vel ))

(defmethod imu_reader::pid_control_reqResponse
  (:init
   (&key
    ((:FL_vel __FL_vel) 0)
    ((:FR_vel __FR_vel) 0)
    ((:BL_vel __BL_vel) 0)
    ((:BR_vel __BR_vel) 0)
    )
   (send-super :init)
   (setq _FL_vel (round __FL_vel))
   (setq _FR_vel (round __FR_vel))
   (setq _BL_vel (round __BL_vel))
   (setq _BR_vel (round __BR_vel))
   self)
  (:FL_vel
   (&optional __FL_vel)
   (if __FL_vel (setq _FL_vel __FL_vel)) _FL_vel)
  (:FR_vel
   (&optional __FR_vel)
   (if __FR_vel (setq _FR_vel __FR_vel)) _FR_vel)
  (:BL_vel
   (&optional __BL_vel)
   (if __BL_vel (setq _BL_vel __BL_vel)) _BL_vel)
  (:BR_vel
   (&optional __BR_vel)
   (if __BR_vel (setq _BR_vel __BR_vel)) _BR_vel)
  (:serialization-length
   ()
   (+
    ;; int32 _FL_vel
    4
    ;; int32 _FR_vel
    4
    ;; int32 _BL_vel
    4
    ;; int32 _BR_vel
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _FL_vel
       (write-long _FL_vel s)
     ;; int32 _FR_vel
       (write-long _FR_vel s)
     ;; int32 _BL_vel
       (write-long _BL_vel s)
     ;; int32 _BR_vel
       (write-long _BR_vel s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _FL_vel
     (setq _FL_vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _FR_vel
     (setq _FR_vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _BL_vel
     (setq _BL_vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _BR_vel
     (setq _BR_vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass imu_reader::pid_control_req
  :super ros::object
  :slots ())

(setf (get imu_reader::pid_control_req :md5sum-) "e3f3937906a511b0cf091d670e4b7a78")
(setf (get imu_reader::pid_control_req :datatype-) "imu_reader/pid_control_req")
(setf (get imu_reader::pid_control_req :request) imu_reader::pid_control_reqRequest)
(setf (get imu_reader::pid_control_req :response) imu_reader::pid_control_reqResponse)

(defmethod imu_reader::pid_control_reqRequest
  (:response () (instance imu_reader::pid_control_reqResponse :init)))

(setf (get imu_reader::pid_control_reqRequest :md5sum-) "e3f3937906a511b0cf091d670e4b7a78")
(setf (get imu_reader::pid_control_reqRequest :datatype-) "imu_reader/pid_control_reqRequest")
(setf (get imu_reader::pid_control_reqRequest :definition-)
      "


float32 yaw
---


int32  FL_vel
int32  FR_vel
int32  BL_vel
int32  BR_vel
")

(setf (get imu_reader::pid_control_reqResponse :md5sum-) "e3f3937906a511b0cf091d670e4b7a78")
(setf (get imu_reader::pid_control_reqResponse :datatype-) "imu_reader/pid_control_reqResponse")
(setf (get imu_reader::pid_control_reqResponse :definition-)
      "


float32 yaw
---


int32  FL_vel
int32  FR_vel
int32  BL_vel
int32  BR_vel
")



(provide :imu_reader/pid_control_req "e3f3937906a511b0cf091d670e4b7a78")


