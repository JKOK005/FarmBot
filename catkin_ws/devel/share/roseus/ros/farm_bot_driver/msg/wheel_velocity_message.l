;; Auto-generated. Do not edit!


(when (boundp 'farm_bot_driver::wheel_velocity_message)
  (if (not (find-package "FARM_BOT_DRIVER"))
    (make-package "FARM_BOT_DRIVER"))
  (shadow 'wheel_velocity_message (find-package "FARM_BOT_DRIVER")))
(unless (find-package "FARM_BOT_DRIVER::WHEEL_VELOCITY_MESSAGE")
  (make-package "FARM_BOT_DRIVER::WHEEL_VELOCITY_MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude wheel_velocity_message.msg.html


(defclass farm_bot_driver::wheel_velocity_message
  :super ros::object
  :slots (_FR_vel _FL_vel _BR_vel _BL_vel ))

(defmethod farm_bot_driver::wheel_velocity_message
  (:init
   (&key
    ((:FR_vel __FR_vel) 0)
    ((:FL_vel __FL_vel) 0)
    ((:BR_vel __BR_vel) 0)
    ((:BL_vel __BL_vel) 0)
    )
   (send-super :init)
   (setq _FR_vel (round __FR_vel))
   (setq _FL_vel (round __FL_vel))
   (setq _BR_vel (round __BR_vel))
   (setq _BL_vel (round __BL_vel))
   self)
  (:FR_vel
   (&optional __FR_vel)
   (if __FR_vel (setq _FR_vel __FR_vel)) _FR_vel)
  (:FL_vel
   (&optional __FL_vel)
   (if __FL_vel (setq _FL_vel __FL_vel)) _FL_vel)
  (:BR_vel
   (&optional __BR_vel)
   (if __BR_vel (setq _BR_vel __BR_vel)) _BR_vel)
  (:BL_vel
   (&optional __BL_vel)
   (if __BL_vel (setq _BL_vel __BL_vel)) _BL_vel)
  (:serialization-length
   ()
   (+
    ;; uint32 _FR_vel
    4
    ;; uint32 _FL_vel
    4
    ;; uint32 _BR_vel
    4
    ;; uint32 _BL_vel
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _FR_vel
       (write-long _FR_vel s)
     ;; uint32 _FL_vel
       (write-long _FL_vel s)
     ;; uint32 _BR_vel
       (write-long _BR_vel s)
     ;; uint32 _BL_vel
       (write-long _BL_vel s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _FR_vel
     (setq _FR_vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _FL_vel
     (setq _FL_vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _BR_vel
     (setq _BR_vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _BL_vel
     (setq _BL_vel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get farm_bot_driver::wheel_velocity_message :md5sum-) "329705fbf5edc3538e8d30fb491f55ed")
(setf (get farm_bot_driver::wheel_velocity_message :datatype-) "farm_bot_driver/wheel_velocity_message")
(setf (get farm_bot_driver::wheel_velocity_message :definition-)
      "# Message structure for wheel angular velocities for Dynamixel series AX
# FR - Front right / FL - Front left / BR - Back right / BL - Back left
# Each wheel can only have positive angular velocities

uint32 FR_vel
uint32 FL_vel
uint32 BR_vel
uint32 BL_vel


")



(provide :farm_bot_driver/wheel_velocity_message "329705fbf5edc3538e8d30fb491f55ed")


