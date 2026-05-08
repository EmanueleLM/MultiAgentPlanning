(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
    roy kathryn amy - participant
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
    (meeting_unscheduled)

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

    (busy roy s_0900_0930)
    (busy roy s_1000_1030)
    (busy roy s_1100_1130)
    (busy roy s_1230_1300)

    (busy kathryn s_0930_1000)
    (busy kathryn s_1630_1700)

    (busy amy s_0900_0930)
    (busy amy s_0930_1000)
    (busy amy s_1000_1030)
    (busy amy s_1030_1100)
    (busy amy s_1100_1130)
    (busy amy s_1130_1200)
    (busy amy s_1200_1230)
    (busy amy s_1230_1300)
    (busy amy s_1300_1330)
    (busy amy s_1330_1400)
    (busy amy s_1400_1430)
    (busy amy s_1500_1530)
    (busy amy s_1530_1600)
    (busy amy s_1630_1700)

    (free roy s_0930_1000)
    (free roy s_1030_1100)
    (free roy s_1130_1200)
    (free roy s_1200_1230)
    (free roy s_1300_1330)
    (free roy s_1330_1400)
    (free roy s_1400_1430)
    (free roy s_1430_1500)
    (free roy s_1500_1530)
    (free roy s_1530_1600)
    (free roy s_1600_1630)
    (free roy s_1630_1700)

    (free kathryn s_0900_0930)
    (free kathryn s_1000_1030)
    (free kathryn s_1030_1100)
    (free kathryn s_1100_1130)
    (free kathryn s_1130_1200)
    (free kathryn s_1200_1230)
    (free kathryn s_1230_1300)
    (free kathryn s_1300_1330)
    (free kathryn s_1330_1400)
    (free kathryn s_1400_1430)
    (free kathryn s_1430_1500)
    (free kathryn s_1500_1530)
    (free kathryn s_1530_1600)
    (free kathryn s_1600_1630)

    (free amy s_1430_1500)
    (free amy s_1600_1630)
  )

  (:goal
    (and
      (scheduled s_1430_1500)
      (not (meeting_unscheduled))
    )
  )
)