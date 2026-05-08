(define (problem calendarscheduling_problem)
  (:domain calendarscheduling)
  (:objects
    willie richard noah - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )
  (:init
    ;; Time order
    (next t0900_0930 t0930_1000)
    (next t0930_1000 t1000_1030)
    (next t1000_1030 t1030_1100)
    (next t1030_1100 t1100_1130)
    (next t1100_1130 t1130_1200)
    (next t1130_1200 t1200_1230)
    (next t1200_1230 t1230_1300)
    (next t1230_1300 t1300_1330)
    (next t1300_1330 t1330_1400)
    (next t1330_1400 t1400_1430)
    (next t1400_1430 t1430_1500)
    (next t1430_1500 t1500_1530)
    (next t1500_1530 t1530_1600)
    (next t1530_1600 t1600_1630)
    (next t1600_1630 t1630_1700)

    ;; Willie is free all day
    (free willie t0900_0930) (free willie t0930_1000) (free willie t1000_1030) (free willie t1030_1100)
    (free willie t1100_1130) (free willie t1130_1200) (free willie t1200_1230) (free willie t1230_1300)
    (free willie t1300_1330) (free willie t1330_1400) (free willie t1400_1430) (free willie t1430_1500)
    (free willie t1500_1530) (free willie t1530_1600) (free willie t1600_1630) (free willie t1630_1700)

    ;; Richard busy 10:00-10:30, 11:00-12:00, 13:00-14:00, 16:00-16:30
    (free richard t0900_0930)
    (free richard t0930_1000)
    ;; 10:00-10:30 busy
    (free richard t1030_1100)
    ;; 11:00-12:00 busy
    (free richard t1200_1230)
    (free richard t1230_1300)
    ;; 13:00-14:00 busy
    (free richard t1400_1430)
    (free richard t1430_1500)
    (free richard t1500_1530)
    (free richard t1530_1600)
    ;; 16:00-16:30 busy
    (free richard t1630_1700)

    ;; Noah busy 10:00-10:30, 11:30-13:00, 13:30-14:00, 14:30-17:00
    (free noah t0900_0930)
    (free noah t0930_1000)
    ;; 10:00-10:30 busy
    (free noah t1030_1100)
    (free noah t1100_1130)
    ;; 11:30-13:00 busy
    (free noah t1300_1330)
    ;; 13:30-14:00 busy
    (free noah t1400_1430)
    ;; 14:30-17:00 busy
  )
  (:goal
    (meeting_scheduled)
  )
)