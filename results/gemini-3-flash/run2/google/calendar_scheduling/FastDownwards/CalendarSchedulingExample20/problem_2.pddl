(define (problem calendar_scheduling_example_20)
  (:domain calendar_scheduling)
  (:objects
    ralph peter daniel - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Ralph's availability
    ;; Busy: 13:30-14:00 (t1330), 14:30-15:00 (t1430)
    (free ralph t0900)
    (free ralph t0930)
    (free ralph t1000)
    (free ralph t1030)
    (free ralph t1100)
    (free ralph t1130)
    (free ralph t1200)
    (free ralph t1230)
    (free ralph t1300)
    (free ralph t1400)
    (free ralph t1500)
    (free ralph t1530)
    (free ralph t1600)
    (free ralph t1630)

    ;; Peter's availability
    ;; Busy: 9:00-9:30 (t0900), 11:00-13:00 (t1100, t1130, t1200, t1230), 16:00-16:30 (t1600)
    (free peter t0930)
    (free peter t1000)
    (free peter t1030)
    (free peter t1300)
    (free peter t1330)
    (free peter t1400)
    (free peter t1430)
    (free peter t1500)
    (free peter t1530)
    (free peter t1630)

    ;; Daniel's availability
    ;; Busy: 9:00-10:00 (t0900, t0930), 10:30-15:30 (t1030-t1500), 16:00-17:00 (t1600, t1630)
    ;; Preference: Avoid meetings after 13:30 (excludes t1330, t1400, t1430, t1500, t1530, t1600, t1630)
    ;; Combining constraints and preferences, Daniel is only free at 10:00-10:30.
    (free daniel t1000)
  )
  (:goal
    (meeting_scheduled)
  )
)