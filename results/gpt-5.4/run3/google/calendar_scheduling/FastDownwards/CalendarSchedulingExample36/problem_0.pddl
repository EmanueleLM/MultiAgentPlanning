(define (problem meeting_schedule_monday_instance)
  (:domain meeting_schedule_monday)

  (:objects
    ryan ruth denise - participant
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

    (busy ryan s_0900_0930)
    (busy ryan s_1230_1300)

    (busy denise s_0930_1000)
    (busy denise s_1000_1030)
    (busy denise s_1200_1230)
    (busy denise s_1230_1300)
    (busy denise s_1430_1500)
    (busy denise s_1500_1530)
    (busy denise s_1530_1600)
    (busy denise s_1600_1630)

    (allowed_start s_1000_1030)
    (allowed_start s_1030_1100)
    (allowed_start s_1100_1130)
    (allowed_start s_1130_1200)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)