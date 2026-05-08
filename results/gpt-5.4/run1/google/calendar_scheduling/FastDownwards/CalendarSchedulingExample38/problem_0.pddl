(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    catherine michael alexander - participant
    t_0900_0930
    t_0930_1000
    t_1000_1030
    t_1030_1100
    t_1100_1130
    t_1130_1200
    t_1200_1230
    t_1230_1300
    t_1300_1330
    t_1330_1400
    t_1400_1430
    t_1430_1500
    t_1500_1530
    t_1530_1600
    t_1600_1630
    t_1630_1700 - time_slot
  )

  (:init
    (blocked catherine t_1030_1100)
    (blocked catherine t_1230_1300)
    (blocked catherine t_1300_1330)
    (blocked catherine t_1430_1500)

    (blocked michael t_0930_1000)
    (blocked michael t_1000_1030)
    (blocked michael t_1200_1230)
    (blocked michael t_1230_1300)
    (blocked michael t_1330_1400)
    (blocked michael t_1500_1530)

    (blocked alexander t_0900_0930)
    (blocked alexander t_1000_1030)
    (blocked alexander t_1100_1130)
    (blocked alexander t_1130_1200)
    (blocked alexander t_1300_1330)
    (blocked alexander t_1400_1430)
    (blocked alexander t_1430_1500)
    (blocked alexander t_1500_1530)
    (blocked alexander t_1530_1600)
    (blocked alexander t_1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled)
      (selected t_1600_1630)
    )
  )
)