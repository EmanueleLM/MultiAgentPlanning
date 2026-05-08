(define (problem meeting_schedule_instance_monday_benjamin_hannah_brenda)
  (:domain meeting_schedule_monday_benjamin_hannah_brenda)

  (:objects
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (free benjamin s_0900_0930)
    (free benjamin s_0930_1000)
    (free benjamin s_1000_1030)
    (free benjamin s_1030_1100)
    (free benjamin s_1100_1130)
    (free benjamin s_1130_1200)
    (free benjamin s_1200_1230)
    (free benjamin s_1230_1300)
    (free benjamin s_1300_1330)
    (free benjamin s_1330_1400)
    (free benjamin s_1400_1430)
    (free benjamin s_1430_1500)
    (free benjamin s_1500_1530)
    (free benjamin s_1530_1600)
    (free benjamin s_1600_1630)
    (free benjamin s_1630_1700)

    (free hannah s_0900_0930)
    (free hannah s_0930_1000)
    (free hannah s_1000_1030)
    (free hannah s_1030_1100)
    (free hannah s_1100_1130)
    (free hannah s_1130_1200)
    (free hannah s_1200_1230)
    (free hannah s_1230_1300)
    (free hannah s_1300_1330)
    (free hannah s_1330_1400)
    (free hannah s_1400_1430)
    (free hannah s_1430_1500)
    (free hannah s_1500_1530)
    (free hannah s_1530_1600)
    (free hannah s_1600_1630)
    (free hannah s_1630_1700)

    (free brenda s_0900_0930)
    (free brenda s_1000_1030)
    (free brenda s_1030_1100)
    (free brenda s_1100_1130)
    (free brenda s_1230_1300)
    (free brenda s_1300_1330)
    (free brenda s_1330_1400)
    (free brenda s_1630_1700)

    (allowed_slot s_0900_0930)
    (allowed_slot s_0930_1000)
  )

  (:goal
    (and
      (meeting_scheduled)
      (scheduled s_0900_0930)
    )
  )
)