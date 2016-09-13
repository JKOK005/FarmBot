;; Auto-generated. Do not edit!


(when (boundp 'imu_reader::veh_state_msg)
  (if (not (find-package "IMU_READER"))
    (make-package "IMU_READER"))
  (shadow 'veh_state_msg (find-package "IMU_READER")))
(unless (find-package "IMU_READER::VEH_STATE_MSG")
  (make-package "IMU_READER::VEH_STATE_MSG"))

(in-package "ROS")
;;//! \htmlinclude veh_state_msg.msg.html


(defclass imu_reader::veh_state_msg
  :super ros::object
  :slots (_vx _vy _th_roll _th_pitch _th_yaw ))

(defmethod imu_reader::veh_state_msg
  (:init
   (&key
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:th_roll __th_roll) 0.0)
    ((:th_pitch __th_pitch) 0.0)
    ((:th_yaw __th_yaw) 0.0)
    )
   (send-super :init)
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _th_roll (float __th_roll))
   (setq _th_pitch (float __th_pitch))
   (setq _th_yaw (float __th_yaw))
   self)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:th_roll
   (&optional __th_roll)
   (if __th_roll (setq _th_roll __th_roll)) _th_roll)
  (:th_pitch
   (&optional __th_pitch)
   (if __th_pitch (setq _th_pitch __th_pitch)) _th_pitch)
  (:th_yaw
   (&optional __th_yaw)
   (if __th_yaw (setq _th_yaw __th_yaw)) _th_yaw)
  (:serialization-length
   ()
   (+
    ;; float32 _vx
    4
    ;; float32 _vy
    4
    ;; float32 _th_roll
    4
    ;; float32 _th_pitch
    4
    ;; float32 _th_yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _th_roll
       (sys::poke _th_roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _th_pitch
       (sys::poke _th_pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _th_yaw
       (sys::poke _th_yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vx
     (setq _vx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vy
     (setq _vy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _th_roll
     (setq _th_roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _th_pitch
     (setq _th_pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _th_yaw
     (setq _th_yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get imu_reader::veh_state_msg :md5sum-) "255b57f2bfaeefe2dc3f6cf83cc6204e")
(setf (get imu_reader::veh_state_msg :datatype-) "imu_reader/veh_state_msg")
(setf (get imu_reader::veh_state_msg :definition-)
      "# Message structure for vehicle state

float32  vx
float32	 vy
float32	 th_roll
float32	 th_pitch
float32  th_yaw

")



(provide :imu_reader/veh_state_msg "255b57f2bfaeefe2dc3f6cf83cc6204e")


