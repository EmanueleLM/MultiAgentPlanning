(define (problem monday-meeting-coordinated)
  (:domain multi_agent_meeting_scheduler)
  (:objects david debra kevin - person
            t9 t10 t11 t12 t13 t14 t15 t16 - time)
  (:init
     (available david t9)  (available david t10) (available david t11) (available david t12)
     (available david t13) (available david t14) (available david t15) (available david t16)

     (available debra t10) (available debra t13) (available debra t15)

     (available kevin t13)
  )
  (:goal (global-scheduled t13))
)