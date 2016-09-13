;; Auto-generated. Do not edit!


(when (boundp 'imu_reader::imu_msgs)
  (if (not (find-package "IMU_READER"))
    (make-package "IMU_READER"))
  (shadow 'imu_msgs (find-package "IMU_READER")))
(unless (find-package "IMU_READER::IMU_MSGS")
  (make-package "IMU_READER::IMU_MSGS"))

(in-package "ROS")
;;//! \htmlinclude imu_msgs.msg.html


(defclass imu_reader::imu_msgs
  :super ros::object
  :slots (_acc_x _acc_y _ang_roll _ang_pitch _ang_yaw ))

(defmethod imu_reader::imu_msgs
  (:init
   (&key
    ((:acc_x __acc_x) 0.0)
    ((:acc_y __acc_y) 0.0)
    ((:ang_roll __ang_roll) 0.0)
    ((:ang_pitch __ang_pitch) 0.0)
    ((:ang_yaw __ang_yaw) 0.0)
    )
   (send-super :init)
   (setq _acc_x (float __acc_x))
   (setq _acc_y (float __acc_y))
   (setq _ang_roll (float __ang_roll))
   (setq _ang_pitch (float __ang_pitch))
   (setq _ang_yaw (float __ang_yaw))
   self)
  (:acc_x
   (&optional __acc_x)
   (if __acc_x (setq _acc_x __acc_x)) _acc_x)
  (:acc_y
   (&optional __acc_y)
   (if __acc_y (setq _acc_y __acc_y)) _acc_y)
  (:ang_roll
   (&optional __ang_roll)
   (if __ang_roll (setq _ang_roll __ang_roll)) _ang_roll)
  (:ang_pitch
   (&optional __ang_pitch)
   (if __ang_pitch (setq _ang_pitch __ang_pitch)) _ang_pitch)
  (:ang_yaw
   (&optional __ang_yaw)
   (if __ang_yaw (setq _ang_yaw __ang_yaw)) _ang_yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _acc_x
    4
    ;; float32 _acc_y
    4
    ;; float32 _ang_roll
    4
    ;; float32 _ang_pitch
    4
    ;; float32 _ang_yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _acc_x
       (sys::poke _acc_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acc_y
       (sys::poke _acc_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ang_roll
       (sys::poke _ang_roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ang_pitch
       (sys::poke _ang_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _ang_yaw
       (sys::poke _ang_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _acc_x
     (setq _acc_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acc_y
     (setq _acc_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ang_roll
     (setq _ang_roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ang_pitch
     (setq _ang_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ang_yaw
     (setq _ang_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get imu_reader::imu_msgs :md5sum-) "cd2c1f924dbee441b71bff2bd002151e")
(setf (get imu_reader::imu_msgs :datatype-) "imu_reader/imu_msgs")
(setf (get imu_reader::imu_msgs :definition-)
      "# Message structure for IMU reading

float32  acc_x
float32	 acc_y
float32	 ang_roll
float32	 ang_pitch
float32  ang_yaw

")



(provide :imu_reader/imu_msgs "cd2c1f924dbee441b71bff2bd002151e")


