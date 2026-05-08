(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    s_0900_0930
    s_0930_1000
    s_1000_1030
    s_1030_1100
    s_1100_1130
    s_1130_1200
    s_1200_1230
    s_1230_1300
    s_1300_1330
    s_1330_1400
    s_1400_1430
    s_1430_1500
    s_1500_1530
    s_1530_1600
    s_1600_1630
    s_1630_1700 - slot
  )

  (:init
    (unscheduled)

    (allowed_start s_0900_0930)
    (allowed_start s_0930_1000)
    (allowed_start s_1000_1030)
    (allowed_start s_1030_1100)
    (allowed_start s_1100_1130)
    (allowed_start s_1130_1200)

    (free diana s_0900_0930)
    (free diana s_0930_1000)
    (free diana s_1000_1030)
    (free diana s_1030_1100)
    (free diana s_1100_1130)
    (free diana s_1200_1230)
    (free diana s_1230_1300)
    (free diana s_1330_1400)
    (free diana s_1400_1430)
    (free diana s_1430_1500)
    (free diana s_1500_1530)
    (free diana s_1530_1600)
    (free diana s_1600_1630)
    (free diana s_1630_1700)

    (free ethan s_0900_0930)
    (free ethan s_0930_1000)
    (free ethan s_1000_1030)
    (free ethan s_1030_1100)
    (free ethan s_1100_1130)
    (free ethan s_1130_1200)
    (free ethan s_1200_1230)
    (free ethan s_1230_1300)
    (free ethan s_1300_1330)
    (free ethan s_1330_1400)
    (free ethan s_1400_1430)
    (free ethan s_1430_1500)
    (free ethan s_1500_1530)
    (free ethan s_1530_1600)
    (free ethan s_1600_1630)
    (free ethan s_1630_1700)

    (free janet s_1000_1030)
    (free janet s_1030_1100)
    (free janet s_1100_1130)
    (free janet s_1130_1200)
    (free janet s_1200_1230)
    (free janet s_1300_1330)
    (free janet s_1330_1400)
    (free janet s_1500_1530)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)