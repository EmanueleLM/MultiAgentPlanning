(define (problem monday-meeting-integrated)
  (:domain meeting-integrated)
  (:objects
     Peter Daniel Ralph - person
     M - meeting
     t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
     t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time
  )

  (:init
     (attends M Peter)
     (attends M Daniel)
     (attends M Ralph)

     ; Peter's availability (Monday)
     (free Peter t09_00) (free Peter t09_30) (free Peter t10_00) (free Peter t10_30)
     (free Peter t11_00) (free Peter t11_30) (free Peter t12_00) (free Peter t12_30)
     (free Peter t13_00) (not (free Peter t13_30)) (free Peter t14_00) (not (free Peter t14_30))
     (free Peter t15_00) (free Peter t15_30) (free Peter t16_00) (free Peter t16_30)

     ; Daniel's availability (Monday)
     (free Daniel t09_00) (free Daniel t09_30) (free Daniel t10_00) (free Daniel t10_30)
     (free Daniel t11_00) (free Daniel t11_30) (free Daniel t12_00) (free Daniel t12_30)
     (free Daniel t13_00) (not (free Daniel t13_30)) (free Daniel t14_00) (not (free Daniel t14_30))
     (free Daniel t15_00) (free Daniel t15_30) (free Daniel t16_00) (free Daniel t16_30)

     ; Ralph's availability
     (free Ralph t09_30) (free Ralph t10_00) (free Ralph t10_30) (free Ralph t13_00) (free Ralph t13_30)
     (free Ralph t14_00) (free Ralph t14_30) (free Ralph t15_00) (free Ralph t15_30)
     (free Ralph t16_00) (free Ralph t16_30)

     ; Initially, the meeting is not scheduled at any time
     (not (meeting_scheduled t09_00)) (not (meeting_scheduled t09_30)) (not (meeting_scheduled t10_00)) (not (meeting_scheduled t10_30))
     (not (meeting_scheduled t11_00)) (not (meeting_scheduled t11_30)) (not (meeting_scheduled t12_00)) (not (meeting_scheduled t12_30))
     (not (meeting_scheduled t13_00)) (not (meeting_scheduled t13_30)) (not (meeting_scheduled t14_00)) (not (meeting_scheduled t14_30))
     (not (meeting_scheduled t15_00)) (not (meeting_scheduled t15_30)) (not (meeting_scheduled t16_00)) (not (meeting_scheduled t16_30))
  )

  ; Goal: find at least one 30-minute slot scheduled
  (:goal (exists (?t - time) (meeting_scheduled ?t)))
)