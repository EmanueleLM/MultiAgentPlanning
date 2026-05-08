(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    alexander elizabeth walter - participant
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
    t_1630_1700 - slot
  )

  (:init
    (busy alexander t_0930_1000)
    (busy alexander t_1030_1100)
    (busy alexander t_1230_1300)
    (busy alexander t_1430_1500)
    (busy alexander t_1600_1630)
    (busy alexander t_1630_1700)

    (busy elizabeth t_0900_0930)
    (busy elizabeth t_1130_1200)
    (busy elizabeth t_1200_1230)
    (busy elizabeth t_1300_1330)
    (busy elizabeth t_1330_1400)
    (busy elizabeth t_1400_1430)

    (busy walter t_0900_0930)
    (busy walter t_0930_1000)
    (busy walter t_1000_1030)
    (busy walter t_1030_1100)
    (busy walter t_1100_1130)
    (busy walter t_1130_1200)
    (busy walter t_1200_1230)
    (busy walter t_1230_1300)
    (busy walter t_1300_1330)
    (busy walter t_1330_1400)
    (busy walter t_1400_1430)
    (busy walter t_1530_1600)
    (busy walter t_1600_1630)
    (busy walter t_1630_1700)
  )

  (:goal
    (and
      (scheduled)
      (meeting_scheduled t_1500_1530)
    )
  )
)