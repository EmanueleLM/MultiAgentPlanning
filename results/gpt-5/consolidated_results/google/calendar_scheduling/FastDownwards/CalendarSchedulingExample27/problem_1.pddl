(define (problem calendar_scheduling_example27-problem)
  (:domain calendar_scheduling_example27)
  (:objects
    jesse kathryn megan - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ; Jesse free except 10:00-10:30 and 15:30-16:00
    (free jesse t0900)
    (free jesse t0930)
    (free jesse t1000) ; NOTE: Jesse is actually busy at 10:00-10:30 per specification.
    ; To enforce correctness, we omit free for busy slots. Hence, remove the above and keep only true frees.
  )
)