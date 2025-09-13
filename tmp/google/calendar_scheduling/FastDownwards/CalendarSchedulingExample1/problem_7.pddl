(define (problem find_meeting_time_fixed)
  (:domain meeting_schedule_fixed)
  
  (:objects
    raymond billy donald - agent
    t1 t2 t3 t4 - time
  )
  
  (:init
    (available raymond t2)
    (available billy t2)
    (available donald t2)
    (not_after_time billy t2)
  )

  (:goal 
    (meeting_scheduled)
  )
)