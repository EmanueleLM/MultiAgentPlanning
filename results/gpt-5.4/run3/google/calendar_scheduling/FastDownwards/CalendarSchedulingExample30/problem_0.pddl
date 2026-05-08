(define (problem schedule_meeting_monday_instance_problem)
  (:domain schedule_meeting_monday_instance)

  (:objects
    jeffrey virginia melissa - participant
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
    (allowed_slot s_0900_0930)
    (allowed_slot s_0930_1000)
    (allowed_slot s_1000_1030)
    (allowed_slot s_1030_1100)
    (allowed_slot s_1100_1130)
    (allowed_slot s_1130_1200)
    (allowed_slot s_1200_1230)
    (allowed_slot s_1230_1300)
    (allowed_slot s_1300_1330)
    (allowed_slot s_1330_1400)
    (allowed_slot s_1400_1430)

    (free jeffrey s_0900_0930)
    (free jeffrey s_1000_1030)
    (free jeffrey s_1100_1130)
    (free jeffrey s_1130_1200)
    (free jeffrey s_1200_1230)
    (free jeffrey s_1230_1300)
    (free jeffrey s_1300_1330)
    (free jeffrey s_1330_1400)
    (free jeffrey s_1400_1430)
    (free jeffrey s_1430_1500)
    (free jeffrey s_1500_1530)
    (free jeffrey s_1530_1600)
    (free jeffrey s_1600_1630)
    (free jeffrey s_1630_1700)

    (free virginia s_0930_1000)
    (free virginia s_1030_1100)
    (free virginia s_1100_1130)
    (free virginia s_1130_1200)
    (free virginia s_1200_1230)
    (free virginia s_1230_1300)
    (free virginia s_1300_1330)
    (free virginia s_1330_1400)
    (free virginia s_1400_1430)
    (free virginia s_1500_1530)
    (free virginia s_1530_1600)
    (free virginia s_1630_1700)

    (free melissa s_1130_1200)
    (free melissa s_1230_1300)
    (free melissa s_1500_1530)
    (free melissa s_1530_1600)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)