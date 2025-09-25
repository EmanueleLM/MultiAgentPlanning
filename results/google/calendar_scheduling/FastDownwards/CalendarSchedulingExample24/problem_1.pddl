(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    benjamin hannah brenda - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )
  (:init
    (participant benjamin)
    (participant hannah)
    (participant brenda)
    (free benjamin t0900_0930) (free benjamin t0930_1000) (free benjamin t1000_1030)
    (free benjamin t1030_1100) (free benjamin t1100_1130) (free benjamin t1130_1200)
    (free benjamin t1200_1230) (free benjamin t1230_1300) (free benjamin t1300_1330)
    (free benjamin t1330_1400) (free benjamin t1400_1430) (free benjamin t1430_1500)
    (free benjamin t1500_1530) (free benjamin t1530_1600) (free benjamin t1600_1630)
    (free benjamin t1630_1700)
    (free hannah t0900_0930) (free hannah t0930_1000) (free hannah t1000_1030)
    (free hannah t1030_1100) (free hannah t1100_1130) (free hannah t1130_1200)
    (free hannah t1200_1230) (free hannah t1230_1300) (free hannah t1300_1330)
    (free hannah t1330_1400) (free hannah t1400_1430) (free hannah t1430_1500)
    (free hannah t1500_1530) (free hannah t1530_1600) (free hannah t1600_1630)
    (free hannah t1630_1700)
    (free brenda t0900_0930)
    (free brenda t1000_1030) (free brenda t1030_1100) (free brenda t1100_1130)
    (free brenda t1230_1300) (free brenda t1300_1330) (free brenda t1330_1400)
    (free brenda t1630_1700)
    (acceptable-for-benjamin t0900_0930)
  )
  (:goal (and (scheduled t0900_0930)))
)