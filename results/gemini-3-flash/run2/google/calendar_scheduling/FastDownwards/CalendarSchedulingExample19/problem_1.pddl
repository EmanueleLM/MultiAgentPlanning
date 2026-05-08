(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling_domain)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
  )
  (:init
    ;; Sequence of time slots
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

    ;; Stephen availability: busy at 10:00-10:30, 13:00-13:30, 14:30-15:00, 16:00-16:30
    (free stephen t0900)
    (free stephen t0930)
    (free stephen t1030)
    (free stephen t1100)
    (free stephen t1130)
    (free stephen t1200)
    (free stephen t1230)
    (free stephen t1330)
    (free stephen t1400)
    (free stephen t1500)
    (free stephen t1530)
    (free stephen t1630)

    ;; Edward availability: busy at 9:00-9:30, 10:00-10:30, 13:30-14:30, 15:00-16:00
    (free edward t0930)
    (free edward t1030)
    (free edward t1100)
    (free edward t1130)
    (free edward t1200)
    (free edward t1230)
    (free edward t1300)
    (free edward t1430)
    (free edward t1600)
    (free edward t1630)

    ;; Angela availability: busy at 9:00-11:30, 12:30-13:00, 13:30-15:30, 16:00-17:00
    (free angela t1130)
    (free angela t1200)
    (free angela t1300)
    (free angela t1530)
  )
  (:goal
    (and
      (meeting_scheduled)
    )
  )
)