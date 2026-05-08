(define (problem calendar_scheduling_example_20)
  (:domain calendar_scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - timeslot
  )
  (:init
    ;; Ralph's availability
    ;; Busy: 13:30 to 14:00 (s1330), 14:30 to 15:00 (s1430)
    (available ralph s0900)
    (available ralph s0930)
    (available ralph s1000)
    (available ralph s1030)
    (available ralph s1100)
    (available ralph s1130)
    (available ralph s1200)
    (available ralph s1230)
    (available ralph s1300)
    (available ralph s1400)
    (available ralph s1500)
    (available ralph s1530)
    (available ralph s1600)
    (available ralph s1630)

    ;; Peter's availability
    ;; Busy: 9:00 to 9:30 (s0900), 11:00 to 13:00 (s1100, s1130, s1200, s1230), 16:00 to 16:30 (s1600)
    (available peter s0930)
    (available peter s1000)
    (available peter s1030)
    (available peter s1300)
    (available peter s1330)
    (available peter s1400)
    (available peter s1430)
    (available peter s1500)
    (available peter s1530)
    (available peter s1630)

    ;; Daniel's availability
    ;; Busy: 9:00 to 10:00 (s0900, s0930), 10:30 to 15:30 (s1030, s1100, s1130, s1200, s1230, s1300, s1330, s1400, s1430, s1500), 16:00 to 17:00 (s1600, s1630)
    ;; Preference: avoid after 13:30 (this excludes s1530)
    (available daniel s1000)
  )
  (:goal (meeting_scheduled))
)