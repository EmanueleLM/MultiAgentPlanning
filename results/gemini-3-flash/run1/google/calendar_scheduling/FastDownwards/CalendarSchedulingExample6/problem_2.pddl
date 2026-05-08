(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Sequence of 30-minute intervals covering 09:00 to 17:00
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

    ;; Thomas's availability: Open the entire day (09:00 to 17:00)
    (available thomas t0900)
    (available thomas t0930)
    (available thomas t1000)
    (available thomas t1030)
    (available thomas t1100)
    (available thomas t1130)
    (available thomas t1200)
    (available thomas t1230)
    (available thomas t1300)
    (available thomas t1330)
    (available thomas t1400)
    (available thomas t1430)
    (available thomas t1500)
    (available thomas t1530)
    (available thomas t1600)
    (available thomas t1630)

    ;; Dylan's availability: Blocked 10:30-11:00 (t1030) and 13:30-14:00 (t1330)
    (available dylan t0900)
    (available dylan t0930)
    (available dylan t1000)
    ;; t1030 busy
    (available dylan t1100)
    (available dylan t1130)
    (available dylan t1200)
    (available dylan t1230)
    (available dylan t1300)
    ;; t1330 busy
    (available dylan t1400)
    (available dylan t1430)
    (available dylan t1500)
    (available dylan t1530)
    (available dylan t1600)
    (available dylan t1630)

    ;; Jerry's availability: Busy 09:00-11:00 (t0900-t1030), 11:30-14:30 (t1130-t1400), 16:00-17:00 (t1600-t1630)
    ;; 09:00 to 11:00 busy
    (available jerry t1100) ;; Gap: 11:00 to 11:30 is free
    ;; 11:30 to 14:30 busy
    (available jerry t1430)
    (available jerry t1500)
    (available jerry t1530)
    ;; 16:00 to 17:00 busy
  )
  (:goal
    (meeting_scheduled)
  )
)