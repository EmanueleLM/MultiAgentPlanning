(define (problem schedule_meeting_emily_melissa_frank_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    meeting_1 - meeting
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
    (unscheduled meeting_1)

    (requires meeting_1 emily)
    (requires meeting_1 melissa)
    (requires meeting_1 frank)

    (allowed meeting_1 s_0900_0930)
    (allowed meeting_1 s_0930_1000)

    (free emily s_0900_0930)
    (free emily s_0930_1000)
    (free emily s_1030_1100)
    (free emily s_1100_1130)
    (free emily s_1230_1300)
    (free emily s_1300_1330)
    (free emily s_1330_1400)
    (free emily s_1500_1530)
    (free emily s_1530_1600)
    (free emily s_1630_1700)

    (free melissa s_0900_0930)
    (free melissa s_1000_1030)
    (free melissa s_1030_1100)
    (free melissa s_1100_1130)
    (free melissa s_1130_1200)
    (free melissa s_1200_1230)
    (free melissa s_1230_1300)
    (free melissa s_1300_1330)
    (free melissa s_1330_1400)
    (free melissa s_1400_1430)
    (free melissa s_1500_1530)
    (free melissa s_1530_1600)
    (free melissa s_1600_1630)
    (free melissa s_1630_1700)

    (free frank s_0900_0930)
    (free frank s_0930_1000)
    (free frank s_1030_1100)
    (free frank s_1130_1200)
    (free frank s_1200_1230)
    (free frank s_1300_1330)
    (free frank s_1430_1500)
    (free frank s_1600_1630)
  )

  (:goal
    (or
      (scheduled_at meeting_1 s_0900_0930)
      (scheduled_at meeting_1 s_0930_1000)
    )
  )
)