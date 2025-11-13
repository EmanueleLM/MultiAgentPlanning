(define (problem meeting_monday_30min)
  (:domain calendar_meeting)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    (feasible t1200)

    (free margaret t1200)
    (free donna t1200)
    (free helen t1200)
  )
  (:goal (scheduled t1200))
)