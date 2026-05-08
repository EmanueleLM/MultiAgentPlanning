(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    raymond billy donald - participant
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100
    t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300
    t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500
    t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - timeslot
  )

  (:init
    (meeting_unscheduled)

    (preferred_slot t_0900_0930)
    (preferred_slot t_0930_1000)
    (preferred_slot t_1000_1030)
    (preferred_slot t_1030_1100)
    (preferred_slot t_1100_1130)
    (preferred_slot t_1130_1200)
    (preferred_slot t_1200_1230)
    (preferred_slot t_1230_1300)
    (preferred_slot t_1300_1330)
    (preferred_slot t_1330_1400)
    (preferred_slot t_1400_1430)
    (preferred_slot t_1430_1500)

    (free raymond t_0930_1000)
    (free raymond t_1000_1030)
    (free raymond t_1030_1100)
    (free raymond t_1100_1130)
    (free raymond t_1200_1230)
    (free raymond t_1230_1300)
    (free raymond t_1330_1400)
    (free raymond t_1400_1430)
    (free raymond t_1430_1500)
    (free raymond t_1530_1600)
    (free raymond t_1600_1630)
    (free raymond t_1630_1700)

    (free billy t_0900_0930)
    (free billy t_0930_1000)
    (free billy t_1030_1100)
    (free billy t_1100_1130)
    (free billy t_1130_1200)
    (free billy t_1300_1330)
    (free billy t_1330_1400)
    (free billy t_1400_1430)
    (free billy t_1430_1500)
    (free billy t_1500_1530)
    (free billy t_1530_1600)
    (free billy t_1600_1630)

    (free donald t_0930_1000)
    (free donald t_1100_1130)
    (free donald t_1130_1200)
    (free donald t_1300_1330)
    (free donald t_1330_1400)
    (free donald t_1430_1500)
    (free donald t_1500_1530)
    (free donald t_1530_1600)
  )

  (:goal
    (and
      (not (meeting_unscheduled))
    )
  )
)