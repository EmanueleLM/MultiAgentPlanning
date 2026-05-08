(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    s_0900_1000
    s_0930_1030
    s_1000_1100
    s_1030_1130
    s_1100_1200
    s_1130_1230
    s_1200_1300
    s_1230_1330
    s_1300_1400
    s_1330_1430
    s_1400_1500
    s_1430_1530
    s_1500_1600
    s_1530_1630
    s_1600_1700 - slot
  )

  (:init
    (meeting_unscheduled)

    (allowed s_0900_1000)
    (allowed s_0930_1030)
    (allowed s_1000_1100)
    (allowed s_1030_1130)
    (allowed s_1100_1200)
    (allowed s_1130_1230)
    (allowed s_1200_1300)
    (allowed s_1230_1330)
    (allowed s_1300_1400)
    (allowed s_1330_1430)

    (free anthony s_1000_1100)
    (free anthony s_1030_1130)
    (free anthony s_1300_1400)
    (free anthony s_1330_1430)
    (free anthony s_1430_1530)
    (free anthony s_1500_1600)

    (free pamela s_1000_1100)
    (free pamela s_1030_1130)
    (free pamela s_1100_1200)
    (free pamela s_1130_1230)
    (free pamela s_1200_1300)
    (free pamela s_1230_1330)
    (free pamela s_1300_1400)
    (free pamela s_1330_1430)

    (free zachary s_1330_1430)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)