(define (problem schedule_meeting_monday)
  (:domain calendar_scheduling)
  (:objects
    ralph peter daniel - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Ralph's availability
    ;; Busy: 13:30-14:00 (t1330), 14:30-15:00 (t1430)
    (available ralph t0900)
    (available ralph t0930)
    (available ralph t1000)
    (available ralph t1030)
    (available ralph t1100)
    (available ralph t1130)
    (available ralph t1200)
    (available ralph t1230)
    (available ralph t1300)
    (available ralph t1400)
    (available ralph t1500)
    (available ralph t1530)
    (available ralph t1600)
    (available ralph t1630)

    ;; Peter's availability
    ;; Busy: 9:00-9:30 (t0900), 11:00-13:00 (t1100, t1130, t1200, t1230), 16:00-16:30 (t1600)
    (available peter t0930)
    (available peter t1000)
    (available peter t1030)
    (available peter t1300)
    (available peter t1330)
    (available peter t1400)
    (available peter t1430)
    (available peter t1500)
    (available peter t1530)
    (available peter t1630)

    ;; Daniel's availability
    ;; Busy: 9:00-10:00 (t0900, t0930), 10:30-15:30 (t1030-t1500), 16:00-17:00 (t1600, t1630)
    ;; Preference: Avoid after 13:30. This restricts Daniel to t1000 only.
    (available daniel t1000)
  )
  (:goal
    (meeting_scheduled)
  )
)