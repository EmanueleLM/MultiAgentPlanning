(define (problem find_meeting_time)
  (:domain meeting_schedule)
  
  (:objects
    t1 t2 t3 t4 t5 - time  ; these represent time slots within the work hours
  )
  
  (:init
    ; Raymond's available times
    (available raymond t1)
    (available raymond t2)
    (available raymond t3)

    ; Billy's available times
    (available billy t2)
    (available billy t3)
    (available billy t4)

    ; Donald's available times
    (available donald t3)
    (available donald t4)
    (available donald t5)
  )

  (:goal 
    (exists (?time - time)
      (and 
        (meeting_scheduled ?time)
      )
    )
  )
)