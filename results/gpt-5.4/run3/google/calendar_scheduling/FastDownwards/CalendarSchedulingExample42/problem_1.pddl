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

    (valid_start s_0900_0930)
    (valid_start s_0930_1000)
    (valid_start s_1000_1030)
    (valid_start s_1030_1100)
    (valid_start s_1100_1130)
    (valid_start s_1130_1200)
    (valid_start s_1200_1230)
    (valid_start s_1230_1300)
    (valid_start s_1300_1330)
    (valid_start s_1330_1400)
    (valid_start s_1400_1430)
    (valid_start s_1430_1500)
    (valid_start s_1500_1530)
    (valid_start s_1530_1600)
    (valid_start s_1600_1630)

    (free julie s_0930_1000)
    (free julie s_1000_1030)
    (free julie s_1030_1100)
    (free julie s_1130_1200)
    (free julie s_1230_1300)
    (free julie s_1300_1330)
    (free julie s_1400_1430)
    (free julie s_1430_1500)
    (free julie s_1500_1530)
    (free julie s_1530_1600)

    (free sean s_0930_1000)
    (free sean s_1000_1030)
    (free sean s_1030_1100)
    (free sean s_1100_1130)
    (free sean s_1130_1200)
    (free sean s_1200_1230)
    (free sean s_1230_1300)
    (free sean s_1330_1400)
    (free sean s_1400_1430)
    (free sean s_1430_1500)
    (free sean s_1530_1600)
    (free sean s_1630_1700)

    (free lori s_0900_0930)
    (free lori s_0930_1000)
    (free lori s_1030_1100)
    (free lori s_1300_1330)
    (free lori s_1330_1400)
    (free lori s_1400_1430)
    (free lori s_1430_1500)
    (free lori s_1500_1530)
  )

  (:goal
    (and
      (meeting_scheduled)
      (meeting_start s_1400_1430)
    )
  )
)