(define (problem meeting_scheduler_monday_instance)
  (:domain meeting_scheduler_monday_specific)

  (:objects
    jesse kathryn megan - participant
    slot_0900_0930
    slot_0930_1000
    slot_1000_1030
    slot_1030_1100
    slot_1100_1130
    slot_1130_1200
    slot_1200_1230
    slot_1230_1300
    slot_1300_1330
    slot_1330_1400
    slot_1400_1430
    slot_1430_1500
    slot_1500_1530
    slot_1530_1600
    slot_1600_1630
    slot_1630_1700 - timeslot
  )

  (:init
    (current_slot slot_0900_0930)

    (next_slot slot_0900_0930 slot_0930_1000)
    (next_slot slot_0930_1000 slot_1000_1030)
    (next_slot slot_1000_1030 slot_1030_1100)
    (next_slot slot_1030_1100 slot_1100_1130)
    (next_slot slot_1100_1130 slot_1130_1200)
    (next_slot slot_1130_1200 slot_1200_1230)
    (next_slot slot_1200_1230 slot_1230_1300)
    (next_slot slot_1230_1300 slot_1300_1330)
    (next_slot slot_1300_1330 slot_1330_1400)
    (next_slot slot_1330_1400 slot_1400_1430)
    (next_slot slot_1400_1430 slot_1430_1500)
    (next_slot slot_1430_1500 slot_1500_1530)
    (next_slot slot_1500_1530 slot_1530_1600)
    (next_slot slot_1530_1600 slot_1600_1630)
    (next_slot slot_1600_1630 slot_1630_1700)

    (free jesse slot_0900_0930)
    (free jesse slot_0930_1000)
    (free jesse slot_1030_1100)
    (free jesse slot_1100_1130)
    (free jesse slot_1130_1200)
    (free jesse slot_1200_1230)
    (free jesse slot_1230_1300)
    (free jesse slot_1300_1330)
    (free jesse slot_1330_1400)
    (free jesse slot_1400_1430)
    (free jesse slot_1430_1500)
    (free jesse slot_1500_1530)
    (free jesse slot_1600_1630)
    (free jesse slot_1630_1700)

    (free kathryn slot_0900_0930)
    (free kathryn slot_0930_1000)
    (free kathryn slot_1000_1030)
    (free kathryn slot_1030_1100)
    (free kathryn slot_1100_1130)
    (free kathryn slot_1130_1200)
    (free kathryn slot_1200_1230)
    (free kathryn slot_1230_1300)
    (free kathryn slot_1300_1330)
    (free kathryn slot_1330_1400)
    (free kathryn slot_1400_1430)
    (free kathryn slot_1430_1500)
    (free kathryn slot_1500_1530)
    (free kathryn slot_1530_1600)
    (free kathryn slot_1600_1630)
    (free kathryn slot_1630_1700)

    (free megan slot_0900_0930)
    (free megan slot_0930_1000)
    (free megan slot_1000_1030)
    (free megan slot_1100_1130)
    (free megan slot_1230_1300)
    (free megan slot_1300_1330)
    (free megan slot_1430_1500)
    (free megan slot_1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled)
      (scheduled slot_0900_0930)
    )
  )
)