(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    bradley zachary teresa - participant
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
    ; bradley free only from 14:30 onward due to hard constraint
    (free bradley s_1430_1500)
    (free bradley s_1500_1530)
    (free bradley s_1530_1600)
    (free bradley s_1600_1630)
    (free bradley s_1630_1700)

    ; zachary free except 10:00-10:30 and 15:00-15:30
    (free zachary s_0900_0930)
    (free zachary s_0930_1000)
    (free zachary s_1030_1100)
    (free zachary s_1100_1130)
    (free zachary s_1130_1200)
    (free zachary s_1200_1230)
    (free zachary s_1230_1300)
    (free zachary s_1300_1330)
    (free zachary s_1330_1400)
    (free zachary s_1400_1430)
    (free zachary s_1430_1500)
    (free zachary s_1530_1600)
    (free zachary s_1600_1630)
    (free zachary s_1630_1700)

    ; teresa free only in unblocked slots
    (free teresa s_1030_1100)
    (free teresa s_1230_1300)
    (free teresa s_1400_1430)
    (free teresa s_1630_1700)
  )

  (:goal
    (and
      (meeting_set)
      (scheduled s_1630_1700)
    )
  )
)