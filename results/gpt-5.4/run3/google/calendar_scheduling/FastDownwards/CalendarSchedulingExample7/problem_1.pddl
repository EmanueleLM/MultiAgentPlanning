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

    (free heather s_0930_1000)
    (free heather s_1000_1030)
    (free heather s_1100_1130)
    (free heather s_1130_1200)
    (free heather s_1200_1230)
    (free heather s_1230_1300)
    (free heather s_1400_1430)
    (free heather s_1500_1530)
    (free heather s_1530_1600)
    (free heather s_1630_1700)

    (free nicholas s_0900_0930)
    (free nicholas s_0930_1000)
    (free nicholas s_1000_1030)
    (free nicholas s_1030_1100)
    (free nicholas s_1100_1130)
    (free nicholas s_1130_1200)
    (free nicholas s_1200_1230)
    (free nicholas s_1230_1300)
    (free nicholas s_1300_1330)
    (free nicholas s_1330_1400)
    (free nicholas s_1400_1430)
    (free nicholas s_1430_1500)
    (free nicholas s_1500_1530)
    (free nicholas s_1530_1600)
    (free nicholas s_1600_1630)
    (free nicholas s_1630_1700)

    (free zachary s_1030_1100)
    (free zachary s_1200_1230)
    (free zachary s_1300_1330)
    (free zachary s_1630_1700)
  )

  (:goal
    (meeting_scheduled)
  )
)