(define (problem monday-meeting-coordinated)
  (:domain multi_agent_meeting_scheduler)
  (:objects david debra kevin - person
            t9 t10 t11 t12 t13 t14 t15 t16 - time
            team_meeting - meeting)

  (:init
     ; Agent 1 availability: David, Debra, Kevin all day Monday (t9..t16)
     (available1 david t9)  (available1 debra t9)  (available1 kevin t9)
     (available1 david t10) (available1 debra t10) (available1 kevin t10)
     (available1 david t11) (available1 debra t11) (available1 kevin t11)
     (available1 david t12) (available1 debra t12) (available1 kevin t12)
     (available1 david t13) (available1 debra t13) (available1 kevin t13)
     (available1 david t14) (available1 debra t14) (available1 kevin t14)
     (available1 david t15) (available1 debra t15) (available1 kevin t15)
     (available1 david t16) (available1 debra t16) (available1 kevin t16)

     ; Agent 2 availability: only 12:00–13:00 (t12)
     (available2 david t12)
     (available2 debra t12)
     (available2 kevin t12)
     (slot60 t12)

     ; Agent 3 availability: 09:00–12:00 and 14:00–17:00 blocks, mapped to t9,t10,t11,t14,t15,t16
     (available3 david t9)
     (available3 debra t9)
     (available3 kevin t9)

     (available3 david t10)
     (available3 debra t10)
     (available3 kevin t10)

     (available3 david t11)
     (available3 debra t11)
     (available3 kevin t11)

     (available3 david t14)
     (available3 debra t14)
     (available3 kevin t14)

     (available3 david t15)
     (available3 debra t15)
     (available3 kevin t15)

     (available3 david t16)
     (available3 debra t16)
     (available3 kevin t16)
  )

  (:goal (global-scheduled t9))
)