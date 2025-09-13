(define (problem find_meeting_time_fixed_fd)
  (:domain meeting_schedule_fixed_fd)

  (:objects
    raymond billy donald - agent
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 - time
  )

  (:init
    (available raymond t2)
    (available raymond t4)
    (available raymond t6)
    (available raymond t8)
    (available billy t2)
    (available billy t4)
    (available billy t6)
    (available billy t8)
    (available donald t2)
    (available donald t4)
    (available donald t6)
    (available donald t8)
  )

  (:goal 
    (meeting_scheduled)
  )
)