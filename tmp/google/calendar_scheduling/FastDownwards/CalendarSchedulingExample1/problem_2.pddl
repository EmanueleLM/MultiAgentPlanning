(define (problem find_meeting_time)
  (:domain meeting_schedule)
  
  (:objects
    raymond billy donald - agent
    t1 t2 t3 t4 t5 - time 
  )
  
  (:init
    (available raymond t2)
    (available raymond t4)

    (available billy t2)
    (available billy t3)

    (available donald t3)
    (available donald t4)
  )

  (:goal 
    (meeting_scheduled)
  )
)