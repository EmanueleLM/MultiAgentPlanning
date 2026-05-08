(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    albert gregory benjamin - participant
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
    t_1630_1700 - timeslot
  )

  (:init
    (next_slot t_0900_0930 t_0930_1000)
    (next_slot t_0930_1000 t_1000_1030)
    (next_slot t_1000_1030 t_1030_1100)
    (next_slot t_1030_1100 t_1100_1130)
    (next_slot t_1100_1130 t_1130_1200)
    (next_slot t_1130_1200 t_1200_1230)
    (next_slot t_1200_1230 t_1230_1300)
    (next_slot t_1230_1300 t_1300_1330)
    (next_slot t_1300_1330 t_1330_1400)
    (next_slot t_1330_1400 t_1400_1430)
    (next_slot t_1400_1430 t_1430_1500)
    (next_slot t_1430_1500 t_1500_1530)
    (next_slot t_1500_1530 t_1530_1600)
    (next_slot t_1530_1600 t_1600_1630)
    (next_slot t_1600_1630 t_1630_1700)

    (candidate t_0900_0930)
    (candidate t_0930_1000)
    (candidate t_1000_1030)
    (candidate t_1030_1100)
    (candidate t_1100_1130)
    (candidate t_1130_1200)
    (candidate t_1200_1230)
    (candidate t_1230_1300)
    (candidate t_1300_1330)
    (candidate t_1330_1400)
    (candidate t_1400_1430)
    (candidate t_1430_1500)
    (candidate t_1500_1530)
    (candidate t_1530_1600)
    (candidate t_1600_1630)
    (candidate t_1630_1700)

    (current t_0900_0930)

    (free albert t_0900_0930)
    (free albert t_1030_1100)
    (free albert t_1100_1130)
    (free albert t_1130_1200)
    (free albert t_1230_1300)
    (free albert t_1300_1330)
    (free albert t_1330_1400)
    (free albert t_1430_1500)
    (free albert t_1530_1600)
    (free albert t_1600_1630)

    (free gregory t_0900_0930)
    (free gregory t_0930_1000)
    (free gregory t_1000_1030)
    (free gregory t_1030_1100)
    (free gregory t_1130_1200)
    (free gregory t_1200_1230)
    (free gregory t_1300_1330)
    (free gregory t_1400_1430)
    (free gregory t_1430_1500)
    (free gregory t_1500_1530)
    (free gregory t_1600_1630)
    (free gregory t_1630_1700)

    (free benjamin t_0900_0930)
    (free benjamin t_1000_1030)
    (free benjamin t_1100_1130)
    (free benjamin t_1330_1400)
    (free benjamin t_1500_1530)
    (free benjamin t_1600_1630)
  )

  (:goal
    (and
      (meeting_set)
      (scheduled t_0900_0930)
    )
  )
)