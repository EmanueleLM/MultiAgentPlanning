(define (problem find_meeting_time)
  (:domain meeting_schedule)
  
  (:objects
    raymond billy donald - agent
    t1 t2 t3 t4 - time
  )
  
  (:init
    (available raymond t2)
    (available raymond t3)

    (available billy t2)
    (available billy t3)
    (not_after_time billy t2)
    (not_after_time billy t3)

    (available donald t2)
    (available donald t3)
  )

  (:goal 
    (meeting_scheduled)
  )
)