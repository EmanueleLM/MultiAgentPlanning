(define (problem schedule_meeting_problem)
  (:domain meeting_scheduler)
  (:objects
    ryan ruth denise - participant
    t0930 t1000 t1030 t1100 t1130 t1200 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
  )
  (:init
    ; Ryan's availability
    (available ryan t0930)
    (available ryan t1000)
    (available ryan t1030)
    (available ryan t1100)
    (available ryan t1130)
    (available ryan t1200)
    (available ryan t1300)
    (available ryan t1330)
    (available ryan t1400)
    (available ryan t1430)
    (available ryan t1500)
    (available ryan t1530)
    (available ryan t1600)
    (available ryan t1630)
    
    ; Ruth's availability (available throughout the day)
    (available ruth t0930)
    (available ruth t1000)
    (available ruth t1030)
    (available ruth t1100)
    (available ruth t1130)
    (available ruth t1200)
    (available ruth t1300)
    (available ruth t1330)
    (available ruth t1400)
    (available ruth t1430)
    (available ruth t1500)
    (available ruth t1530)
    (available ruth t1600)
    (available ruth t1630)

    ; Denise's availability
    (available denise t1030)
    (available denise t1100)
    (available denise t1130)
  )
  (:goal
    (exists (?t - time_slot) (meeting_time ?t))
  )
)