;; Auto-generated. Do not edit!


(when (boundp 'arduino_driver::encoder_vel_msg)
  (if (not (find-package "ARDUINO_DRIVER"))
    (make-package "ARDUINO_DRIVER"))
  (shadow 'encoder_vel_msg (find-package "ARDUINO_DRIVER")))
(unless (find-package "ARDUINO_DRIVER::ENCODER_VEL_MSG")
  (make-package "ARDUINO_DRIVER::ENCODER_VEL_MSG"))

(in-package "ROS")
;;//! \htmlinclude encoder_vel_msg.msg.html


(defclass arduino_driver::encoder_vel_msg
  :super ros::object
  :slots (_v_FL _v_FR _v_BL _v_BR ))

(defmethod arduino_driver::encoder_vel_msg
  (:init
   (&key
    ((:v_FL __v_FL) 0.0)
    ((:v_FR __v_FR) 0.0)
    ((:v_BL __v_BL) 0.0)
    ((:v_BR __v_BR) 0.0)
    )
   (send-super :init)
   (setq _v_FL (float __v_FL))
   (setq _v_FR (float __v_FR))
   (setq _v_BL (float __v_BL))
   (setq _v_BR (float __v_BR))
   self)
  (:v_FL
   (&optional __v_FL)
   (if __v_FL (setq _v_FL __v_FL)) _v_FL)
  (:v_FR
   (&optional __v_FR)
   (if __v_FR (setq _v_FR __v_FR)) _v_FR)
  (:v_BL
   (&optional __v_BL)
   (if __v_BL (setq _v_BL __v_BL)) _v_BL)
  (:v_BR
   (&optional __v_BR)
   (if __v_BR (setq _v_BR __v_BR)) _v_BR)
  (:serialization-length
   ()
   (+
    ;; float32 _v_FL
    4
    ;; float32 _v_FR
    4
    ;; float32 _v_BL
    4
    ;; float32 _v_BR
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _v_FL
       (sys::poke _v_FL (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_FR
       (sys::poke _v_FR (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_BL
       (sys::poke _v_BL (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v_BR
       (sys::poke _v_BR (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _v_FL
     (setq _v_FL (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_FR
     (setq _v_FR (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_BL
     (setq _v_BL (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v_BR
     (setq _v_BR (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get arduino_driver::encoder_vel_msg :md5sum-) "be2929595248f844b23cba7dd4647f3c")
(setf (get arduino_driver::encoder_vel_msg :datatype-) "arduino_driver/encoder_vel_msg")
(setf (get arduino_driver::encoder_vel_msg :definition-)
      "# Message structure for Encoder velocities 
# FL - Front left, FR - Front right, BL - Back left, BR - Back right

float32	 v_FL	
float32	 v_FR
float32  v_BL
float32  v_BR
")



(provide :arduino_driver/encoder_vel_msg "be2929595248f844b23cba7dd4647f3c")


