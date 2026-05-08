(define (problem meeting_schedule_instance_monday)
  (:domain meeting_schedule_monday_halfhour)

  (:objects
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (free gregory s_0900_0930)
    (free gregory s_0930_1000)
    (free gregory s_1000_1030)
    (free gregory s_1030_1100)
    (free gregory s_1130_1200)
    (free gregory s_1230_1300)
    (free gregory s_1300_1330)
    (free gregory s_1330_1400)
    (free gregory s_1400_1430)
    (free gregory s_1430_1500)
    (free gregory s_1500_1530)
    (free gregory s_1630_1700)

    (free teresa s_0900_0930)
    (free teresa s_0930_1000)
    (free teresa s_1000_1030)
    (free teresa s_1030_1100)
    (free teresa s_1100_1130)
    (free teresa s_1130_1200)
    (free teresa s_1200_1230)
    (free teresa s_1230_1300)
    (free teresa s_1300_1330)
    (free teresa s_1330_1400)
    (free teresa s_1400_1430)
    (free teresa s_1430_1500)
    (free teresa s_1500_1530)
    (free teresa s_1530_1600)
    (free teresa s_1600_1630)
    (free teresa s_1630_1700)

    (free carol s_1030_1100)
    (free carol s_1600_1630)
  )

  (:goal
    (meeting_scheduled)
  )
)