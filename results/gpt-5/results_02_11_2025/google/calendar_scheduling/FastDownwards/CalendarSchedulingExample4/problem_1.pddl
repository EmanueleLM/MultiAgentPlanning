(define (problem schedule-monday-0900-1700)
  (:domain calendar-scheduling-example4)
  (:objects
    donna john billy - agent
    w0900_0930 w0930_1000 w1000_1030 w1030_1100
    w1100_1130 w1130_1200 w1200_1230 w1230_1300
    w1300_1330 w1330_1400 w1400_1430 w1430_1500
    w1500_1530 w1530_1600 w1600_1630 w1630_1700 - window
  )
  (:init
    ; Work hours windows
    (within_work_hours w0900_0930)
    (within_work_hours w0930_1000)
    (within_work_hours w1000_1030)
    (within_work_hours w1030_1100)
    (within_work_hours w1100_1130)
    (within_work_hours w1130_1200)
    (within_work_hours w1200_1230)
    (within_work_hours w1230_1300)
    (within_work_hours w1300_1330)
    (within_work_hours w1330_1400)
    (within_work_hours w1400_1430)
    (within_work_hours w1430_1500)
    (within_work_hours w1500_1530)
    (within_work_hours w1530_1600)
    (within_work_hours w1600_1630)
    (within_work_hours w1630_1700)

    ; Donna free except 14:00-14:30 and 15:30-16:00
    (free donna w0900_0930)
    (free donna w0930_1000)
    (free donna w1000_1030)
    (free donna w1030_1100)
    (free donna w1100_1130)
    (free donna w1130_1200)
    (free donna w1200_1230)
    (free donna w1230_1300)
    (free donna w1300_1330)
    (free donna w1330_1400)
    (free donna w1430_1500)
    (free donna w1500_1530)
    (free donna w1600_1630)
    (free donna w1630_1700)

    ; John free except 11:00-11:30 and 16:30-17:00
    (free john w0900_0930)
    (free john w0930_1000)
    (free john w1000_1030)
    (free john w1030_1100)
    (free john w1130_1200)
    (free john w1200_1230)
    (free john w1230_1300)
    (free john w1300_1330)
    (free john w1330_1400)
    (free john w1400_1430)
    (free john w1430_1500)
    (free john w1500_1530)
    (free john w1530_1600)
    (free john w1600_1630)

    ; Billy free only 10:00-10:30 and 14:00-14:30
    (free billy w1000_1030)
    (free billy w1400_1430)

    ; Windows where all three are free
    (all_free w1000_1030)
  )
  (:goal (scheduled))
)