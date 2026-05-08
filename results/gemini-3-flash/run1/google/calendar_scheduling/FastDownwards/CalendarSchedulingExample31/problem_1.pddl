(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; Richard is busy on Monday during 13:30 to 14:00 (s1330), 15:00 to 15:30 (s1500).
    ;; Richard is available at all other slots:
    (available richard s0900)
    (available richard s0930)
    (available richard s1000)
    (available richard s1030)
    (available richard s1100)
    (available richard s1130)
    (available richard s1200)
    (available richard s1230)
    (available richard s1300)
    ;; s1330 is busy
    (available richard s1400)
    (available richard s1430)
    ;; s1500 is busy
    (available richard s1530)
    (available richard s1600)
    (available richard s1630)

    ;; Martha has blocked their calendar on Monday during 9:00 to 9:30 (s0900), 13:00 to 13:30 (s1300).
    ;; Martha does not want to meet on Monday before 14:00 (blocking s0900, s0930, s1000, s1030, s1100, s1130, s1200, s1230, s1300, s1330).
    ;; Martha is available for slots starting at 14:00 or later:
    (available martha s1400)
    (available martha s1430)
    (available martha s1500)
    (available martha s1530)
    (available martha s1600)
    (available martha s1630)

    ;; Kimberly is busy on Monday during:
    ;; 9:00 to 11:00 (s0900, s0930, s1000, s1030)
    ;; 11:30 to 12:00 (s1130)
    ;; 12:30 to 13:00 (s1230)
    ;; 14:00 to 16:00 (s1400, s1430, s1500, s1530)
    ;; Kimberly is available at:
    (available kimberly s1100)
    (available kimberly s1200)
    (available kimberly s1300)
    (available kimberly s1330)
    (available kimberly s1600)
    (available kimberly s1630)
  )
  (:goal (is_scheduled))
)