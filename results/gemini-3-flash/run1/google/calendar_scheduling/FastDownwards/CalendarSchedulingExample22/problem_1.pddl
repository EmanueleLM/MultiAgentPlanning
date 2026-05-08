(define (problem calendar_scheduling_example_22)
  (:domain calendar_scheduling)
  (:objects
    theresa charles betty - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Time continuity
    (next t0900 t0930)
    (next t0930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)
    (next t1130 t1200)
    (next t1200 t1230)
    (next t1230 t1300)
    (next t1300 t1330)
    (next t1330 t1400)
    (next t1400 t1430)
    (next t1430 t1500)
    (next t1500 t1530)
    (next t1530 t1600)
    (next t1600 t1630)

    ;; Theresa's schedule
    ;; 9:00 to 9:30, 12:30 to 13:30, 14:00 to 15:00, 16:30 to 17:00
    (is_busy theresa t0900)
    (is_busy theresa t1230)
    (is_busy theresa t1300)
    (is_busy theresa t1400)
    (is_busy theresa t1430)
    (is_busy theresa t1630)

    ;; Charles's schedule
    ;; 10:00 to 10:30, 11:30 to 12:30, 14:00 to 15:30
    (is_busy charles t1000)
    (is_busy charles t1130)
    (is_busy charles t1200)
    (is_busy charles t1400)
    (is_busy charles t1430)
    (is_busy charles t1500)

    ;; Betty's schedule
    ;; 9:00 to 10:30, 12:00 to 12:30, 13:00 to 14:00, 15:00 to 16:00
    (is_busy betty t0900)
    (is_busy betty t0930)
    (is_busy betty t1000)
    (is_busy betty t1200)
    (is_busy betty t1300)
    (is_busy betty t1330)
    (is_busy betty t1500)
    (is_busy betty t1530)
  )
  (:goal
    (meeting_scheduled)
  )
)