
(cl:in-package :asdf)

(defsystem "arduino_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "encoder_vel_msg" :depends-on ("_package_encoder_vel_msg"))
    (:file "_package_encoder_vel_msg" :depends-on ("_package"))
  ))