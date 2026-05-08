(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling_domain)
  (:objects
    s0900_0930 s0930_1000 s1000_1030 s1030_1100 s1100_1130 s1130_1200
    s1200_1230 s1230_1300 s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - timeslot
  )
  (:init
    ;; Arthur's blocked times: 9:30-10:00, 14:00-14:30
    (is_busy arthur s0930_1000)
    (is_busy arthur s1400_1430)

    ;; Theresa's blocked times: 9:00-9:30, 12:00-13:00, 15:00-16:30
    (is_busy theresa s0900_0930)
    (is_busy theresa s1200_1230)
    (is_busy theresa s1230_1300)
    (is_busy theresa s1500_1530)
    (is_busy theresa s1530_1600)
    (is_busy theresa s1600_1630)

    ;; Carl's blocked times: 9:00-11:30, 12:00-14:00, 14:30-17:00
    (is_busy carl s0900_0930)
    (is_busy carl s0930_1000)
    (is_busy carl s1000_1030)
    (is_busy carl s1030_1100)
    (is_busy carl s1100_1130)
    (is_busy carl s1200_1230)
    (is_busy carl s1230_1300)
    (is_busy carl s1300_1330)
    (is_busy carl s1330_1400)
    (is_busy carl s1430_1500)
    (is_busy carl s1500_1530)
    (is_busy carl s1530_1600)
    (is_busy carl s1600_1630)
    (is_busy carl s1630_1700)
  )
  (:goal (success))
)