(define (problem calendar_scheduling_example7)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Heather's existing schedule: blocked 9:00-9:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30
    (available heather t0930)
    (available heather t1000)
    (available heather t1100)
    (available heather t1130)
    (available heather t1200)
    (available heather t1230)
    (available heather t1400)
    (available heather t1500)
    (available heather t1530)
    (available heather t1630)

    ;; Nicholas's existing schedule: no meetings the whole day
    (available nicholas t0900)
    (available nicholas t0930)
    (available nicholas t1000)
    (available nicholas t1030)
    (available nicholas t1100)
    (available nicholas t1130)
    (available nicholas t1200)
    (available nicholas t1230)
    (available nicholas t1300)
    (available nicholas t1330)
    (available nicholas t1400)
    (available nicholas t1430)
    (available nicholas t1500)
    (available nicholas t1530)
    (available nicholas t1600)
    (available nicholas t1630)

    ;; Zachary's existing schedule: blocked 9:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30
    ;; Zachary Preference: Rather not meet on Monday after 14:00 (t1400, t1430, t1500, t1530, t1600, t1630)
    (available zachary t1030)
    (available zachary t1200)
    (available zachary t1300)
    ;; Slot t1630 is free but violates preference constraint "after 14:00".
  )
  (:goal (meeting_scheduled))
)