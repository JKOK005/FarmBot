
(cl:in-package :asdf)

(defsystem "imu_reader-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "veh_state_msg" :depends-on ("_package_veh_state_msg"))
    (:file "_package_veh_state_msg" :depends-on ("_package"))
  ))