(define (problem schedule_meeting_example)
  (:domain calendar_scheduling)
  (:objects
    ryan ruth denise - participant
    t0930 t1000 t1030 t1100 t1130 t1200 - time_slot
  )
  (:init
    ; Ryan's availability
    (available ryan t0930)
    (available ryan t1000)
    (available ryan t1030)
    (available ryan t1100)
    (available ryan t1130)
    (available ryan t1200)
    
    ; Ruth's availability (available throughout the acknowledged times)
    (available ruth t0930)
    (available ruth t1000)
    (available ruth t1030)
    (available ruth t1100)
    (available ruth t1130)
    (available ruth t1200)

    ; Denise's availability
    (available denise t1000)
    (available denise t1030)
    (available denise t1100)
    
    ; Time slots properly reflect the constraints
  )
  (:goal
    (exists (?t - time_slot) (meeting_scheduled ?t))
  )
)