(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
    roy kathryn amy - participant
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (meeting_unscheduled)

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
      (not (meeting_unscheduled))
    )
  )
)