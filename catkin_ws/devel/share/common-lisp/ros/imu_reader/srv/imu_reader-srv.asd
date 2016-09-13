
(cl:in-package :asdf)

(defsystem "imu_reader-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "pid_control_req" :depends-on ("_package_pid_control_req"))
    (:file "_package_pid_control_req" :depends-on ("_package"))
  ))