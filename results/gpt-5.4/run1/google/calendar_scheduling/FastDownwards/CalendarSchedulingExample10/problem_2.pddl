(define (problem meeting_schedule_instance_monday)
  (:domain meeting_schedule_monday_halfhour)

  (:objects
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100
    t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300
    t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500
    t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - slot
  )

  (:init
    (meeting_unscheduled)

    (allowed_slot t_0900_0930)
    (allowed_slot t_0930_1000)
    (allowed_slot t_1000_1030)
    (allowed_slot t_1030_1100)
    (allowed_slot t_1100_1130)
    (allowed_slot t_1130_1200)

    (free diana t_0900_0930)
    (free diana t_0930_1000)
    (free diana t_1000_1030)
    (free diana t_1030_1100)
    (free diana t_1100_1130)
    (free diana t_1200_1230)
    (free diana t_1230_1300)
    (free diana t_1330_1400)
    (free diana t_1400_1430)
    (free diana t_1430_1500)
    (free diana t_1500_1530)
    (free diana t_1530_1600)
    (free diana t_1600_1630)
    (free diana t_1630_1700)

    (free ethan t_0900_0930)
    (free ethan t_0930_1000)
    (free ethan t_1000_1030)
    (free ethan t_1030_1100)
    (free ethan t_1100_1130)
    (free ethan t_1130_1200)
    (free ethan t_1200_1230)
    (free ethan t_1230_1300)
    (free ethan t_1300_1330)
    (free ethan t_1330_1400)
    (free ethan t_1400_1430)
    (free ethan t_1430_1500)
    (free ethan t_1500_1530)
    (free ethan t_1530_1600)
    (free ethan t_1600_1630)
    (free ethan t_1630_1700)

    (free janet t_1000_1030)
    (free janet t_1030_1100)
    (free janet t_1100_1130)
    (free janet t_1130_1200)
    (free janet t_1200_1230)
    (free janet t_1300_1330)
    (free janet t_1330_1400)
    (free janet t_1500_1530)
  )

  (:goal
    (meeting_scheduled)
  )
)