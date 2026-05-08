(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    anthony pamela zachary - participant
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
    (next_slot s_0900_0930 s_0930_1000)
    (next_slot s_0930_1000 s_1000_1030)
    (next_slot s_1000_1030 s_1030_1100)
    (next_slot s_1030_1100 s_1100_1130)
    (next_slot s_1100_1130 s_1130_1200)
    (next_slot s_1130_1200 s_1200_1230)
    (next_slot s_1200_1230 s_1230_1300)
    (next_slot s_1230_1300 s_1300_1330)
    (next_slot s_1300_1330 s_1330_1400)
    (next_slot s_1330_1400 s_1400_1430)
    (next_slot s_1400_1430 s_1430_1500)
    (next_slot s_1430_1500 s_1500_1530)
    (next_slot s_1500_1530 s_1530_1600)
    (next_slot s_1530_1600 s_1600_1630)
    (next_slot s_1600_1630 s_1630_1700)

    (free anthony s_0900_0930)
    (free anthony s_1000_1030)
    (free anthony s_1030_1100)
    (free anthony s_1100_1130)
    (free anthony s_1130_1200)
    (free anthony s_1300_1330)
    (free anthony s_1330_1400)
    (free anthony s_1400_1430)
    (free anthony s_1430_1500)
    (free anthony s_1500_1530)
    (free anthony s_1530_1600)
    (free anthony s_1630_1700)

    (free pamela s_0900_0930)
    (free pamela s_1000_1030)
    (free pamela s_1030_1100)
    (free pamela s_1100_1130)
    (free pamela s_1130_1200)
    (free pamela s_1200_1230)
    (free pamela s_1230_1300)
    (free pamela s_1300_1330)
    (free pamela s_1330_1400)
    (free pamela s_1400_1430)

    (free zachary s_1130_1200)
    (free zachary s_1230_1300)
    (free zachary s_1330_1400)
    (free zachary s_1400_1430)
    (free zachary s_1500_1530)
    (free zachary s_1530_1600)
  )

  (:goal
    (and
      (started)
      (start_slot s_1330_1400)
      (selected s_1330_1400)
      (selected s_1400_1430)
    )
  )
)