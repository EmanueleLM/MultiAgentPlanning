(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )

  (:init
    (next_slot t0900_0930 t0930_1000)
    (next_slot t0930_1000 t1000_1030)
    (next_slot t1000_1030 t1030_1100)
    (next_slot t1030_1100 t1100_1130)
    (next_slot t1100_1130 t1130_1200)
    (next_slot t1130_1200 t1200_1230)
    (next_slot t1200_1230 t1230_1300)
    (next_slot t1230_1300 t1300_1330)
    (next_slot t1300_1330 t1330_1400)
    (next_slot t1330_1400 t1400_1430)
    (next_slot t1400_1430 t1430_1500)
    (next_slot t1430_1500 t1500_1530)
    (next_slot t1500_1530 t1530_1600)
    (next_slot t1530_1600 t1600_1630)
    (next_slot t1600_1630 t1630_1700)

    (free julie t0930_1000)
    (free julie t1000_1030)
    (free julie t1030_1100)
    (free julie t1130_1200)
    (free julie t1230_1300)
    (free julie t1300_1330)
    (free julie t1400_1430)
    (free julie t1430_1500)
    (free julie t1500_1530)
    (free julie t1530_1600)

    (free sean t0930_1000)
    (free sean t1000_1030)
    (free sean t1030_1100)
    (free sean t1100_1130)
    (free sean t1130_1200)
    (free sean t1200_1230)
    (free sean t1230_1300)
    (free sean t1330_1400)
    (free sean t1400_1430)
    (free sean t1430_1500)
    (free sean t1530_1600)
    (free sean t1630_1700)

    (free lori t0900_0930)
    (free lori t0930_1000)
    (free lori t1030_1100)
    (free lori t1300_1330)
    (free lori t1330_1400)
    (free lori t1400_1430)
    (free lori t1430_1500)
    (free lori t1500_1530)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)