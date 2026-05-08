(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    isabella ronald amanda - participant
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
    meeting_1 - meeting
  )

  (:init
    (unscheduled meeting_1)

    (free isabella s_0900_0930)
    (free isabella s_0930_1000)
    (free isabella s_1000_1030)
    (free isabella s_1030_1100)
    (free isabella s_1100_1130)
    (free isabella s_1130_1200)
    (free isabella s_1200_1230)
    (free isabella s_1230_1300)
    (free isabella s_1300_1330)
    (free isabella s_1330_1400)
    (free isabella s_1400_1430)
    (free isabella s_1430_1500)
    (free isabella s_1500_1530)
    (free isabella s_1530_1600)
    (free isabella s_1600_1630)
    (free isabella s_1630_1700)

    (free ronald s_0900_0930)
    (free ronald s_0930_1000)
    (free ronald s_1000_1030)
    (free ronald s_1030_1100)
    (free ronald s_1100_1130)
    (free ronald s_1200_1230)
    (free ronald s_1230_1300)
    (free ronald s_1300_1330)
    (free ronald s_1330_1400)
    (free ronald s_1430_1500)
    (free ronald s_1500_1530)
    (free ronald s_1530_1600)

    (free amanda s_0900_0930)
    (free amanda s_1200_1230)
    (free amanda s_1300_1330)
    (free amanda s_1400_1430)
    (free amanda s_1430_1500)
    (free amanda s_1500_1530)

    (allowed_slot s_0900_0930)
    (allowed_slot s_0930_1000)
    (allowed_slot s_1000_1030)
    (allowed_slot s_1030_1100)
    (allowed_slot s_1100_1130)
    (allowed_slot s_1130_1200)
    (allowed_slot s_1200_1230)
    (allowed_slot s_1230_1300)
    (allowed_slot s_1300_1330)
  )

  (:goal
    (and
      (scheduled meeting_1)
      (scheduled_at meeting_1 s_0900_0930)
    )
  )
)