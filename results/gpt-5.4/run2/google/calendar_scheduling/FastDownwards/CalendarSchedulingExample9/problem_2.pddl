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
    (meeting_unscheduled)

    (free diane s_0930_1000)
    (free diane s_1000_1030)
    (free diane s_1030_1100)
    (free diane s_1100_1130)
    (free diane s_1130_1200)
    (free diane s_1230_1300)
    (free diane s_1300_1330)
    (free diane s_1330_1400)
    (free diane s_1400_1430)
    (free diane s_1530_1600)
    (free diane s_1600_1630)
    (free diane s_1630_1700)

    (free kelly s_0900_0930)
    (free kelly s_1000_1030)
    (free kelly s_1100_1130)
    (free kelly s_1130_1200)
    (free kelly s_1200_1230)
    (free kelly s_1230_1300)
    (free kelly s_1300_1330)
    (free kelly s_1330_1400)
    (free kelly s_1400_1430)
    (free kelly s_1430_1500)
    (free kelly s_1500_1530)
    (free kelly s_1530_1600)
    (free kelly s_1600_1630)
    (free kelly s_1630_1700)

    (free deborah s_0930_1000)
    (free deborah s_1400_1430)
  )

  (:goal
    (and
      (meeting_scheduled)
      (scheduled s_1400_1430)
    )
  )
)