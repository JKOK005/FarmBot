
(cl:in-package :asdf)

(defsystem "farm_bot_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "wheel_velocity_msg" :depends-on ("_package_wheel_velocity_msg"))
    (:file "_package_wheel_velocity_msg" :depends-on ("_package"))
  ))