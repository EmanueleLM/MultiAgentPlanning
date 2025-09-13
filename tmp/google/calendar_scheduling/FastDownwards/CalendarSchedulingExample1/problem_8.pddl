(define (problem find_meeting_time_fixed)
  (:domain meeting_schedule_fixed)
  
  (:objects
    raymond billy donald - agent
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 - time
  )
  
  (:init
    (available raymond t1)
    (available raymond t3)
    (available raymond t5)
    (available raymond t7)
    (available billy t1)
    (available billy t3)
    (available billy t5)
    (available billy t7)
    (available donald t3)
    (available donald t5)
    (available donald t7)
    (available donald t9)
    (not_after_time billy t7)
  )

  (:goal 
    (meeting_scheduled)
  )
)