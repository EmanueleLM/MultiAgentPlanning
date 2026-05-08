(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    albert gregory benjamin - participant
    t0900_0930
    t0930_1000
    t1000_1030
    t1030_1100
    t1100_1130
    t1130_1200
    t1200_1230
    t1230_1300
    t1300_1330
    t1330_1400
    t1400_1430
    t1430_1500
    t1500_1530
    t1530_1600
    t1600_1630
    t1630_1700 - slot
  )

  (:init
    (required albert)
    (required gregory)
    (required benjamin)

    (available albert t0900_0930)
    (available albert t1030_1100)
    (available albert t1100_1130)
    (available albert t1130_1200)
    (available albert t1230_1300)
    (available albert t1300_1330)
    (available albert t1330_1400)
    (available albert t1430_1500)
    (available albert t1530_1600)
    (available albert t1600_1630)

    (available gregory t0900_0930)
    (available gregory t0930_1000)
    (available gregory t1000_1030)
    (available gregory t1030_1100)
    (available gregory t1130_1200)
    (available gregory t1200_1230)
    (available gregory t1300_1330)
    (available gregory t1400_1430)
    (available gregory t1430_1500)
    (available gregory t1500_1530)
    (available gregory t1600_1630)
    (available gregory t1630_1700)

    (available benjamin t0900_0930)
    (available benjamin t1000_1030)
    (available benjamin t1100_1130)
    (available benjamin t1330_1400)
    (available benjamin t1500_1530)
    (available benjamin t1600_1630)

    (joint_candidate t0900_0930)
    (joint_candidate t1000_1030)
    (joint_candidate t1300_1330)
    (joint_candidate t1600_1630)

    (earliest_candidate t0900_0930)

    (earlier t0900_0930 t0930_1000)
    (earlier t0900_0930 t1000_1030)
    (earlier t0900_0930 t1030_1100)
    (earlier t0900_0930 t1100_1130)
    (earlier t0900_0930 t1130_1200)
    (earlier t0900_0930 t1200_1230)
    (earlier t0900_0930 t1230_1300)
    (earlier t0900_0930 t1300_1330)
    (earlier t0900_0930 t1330_1400)
    (earlier t0900_0930 t1400_1430)
    (earlier t0900_0930 t1430_1500)
    (earlier t0900_0930 t1500_1530)
    (earlier t0900_0930 t1530_1600)
    (earlier t0900_0930 t1600_1630)
    (earlier t0900_0930 t1630_1700)

    (earlier t0930_1000 t1000_1030)
    (earlier t0930_1000 t1030_1100)
    (earlier t0930_1000 t1100_1130)
    (earlier t0930_1000 t1130_1200)
    (earlier t0930_1000 t1200_1230)
    (earlier t0930_1000 t1230_1300)
    (earlier t0930_1000 t1300_1330)
    (earlier t0930_1000 t1330_1400)
    (earlier t0930_1000 t1400_1430)
    (earlier t0930_1000 t1430_1500)
    (earlier t0930_1000 t1500_1530)
    (earlier t0930_1000 t1530_1600)
    (earlier t0930_1000 t1600_1630)
    (earlier t0930_1000 t1630_1700)

    (earlier t1000_1030 t1030_1100)
    (earlier t1000_1030 t1100_1130)
    (earlier t1000_1030 t1130_1200)
    (earlier t1000_1030 t1200_1230)
    (earlier t1000_1030 t1230_1300)
    (earlier t1000_1030 t1300_1330)
    (earlier t1000_1030 t1330_1400)
    (earlier t1000_1030 t1400_1430)
    (earlier t1000_1030 t1430_1500)
    (earlier t1000_1030 t1500_1530)
    (earlier t1000_1030 t1530_1600)
    (earlier t1000_1030 t1600_1630)
    (earlier t1000_1030 t1630_1700)

    (earlier t1030_1100 t1100_1130)
    (earlier t1030_1100 t1130_1200)
    (earlier t1030_1100 t1200_1230)
    (earlier t1030_1100 t1230_1300)
    (earlier t1030_1100 t1300_1330)
    (earlier t1030_1100 t1330_1400)
    (earlier t1030_1100 t1400_1430)
    (earlier t1030_1100 t1430_1500)
    (earlier t1030_1100 t1500_1530)
    (earlier t1030_1100 t1530_1600)
    (earlier t1030_1100 t1600_1630)
    (earlier t1030_1100 t1630_1700)

    (earlier t1100_1130 t1130_1200)
    (earlier t1100_1130 t1200_1230)
    (earlier t1100_1130 t1230_1300)
    (earlier t1100_1130 t1300_1330)
    (earlier t1100_1130 t1330_1400)
    (earlier t1100_1130 t1400_1430)
    (earlier t1100_1130 t1430_1500)
    (earlier t1100_1130 t1500_1530)
    (earlier t1100_1130 t1530_1600)
    (earlier t1100_1130 t1600_1630)
    (earlier t1100_1130 t1630_1700)

    (earlier t1130_1200 t1200_1230)
    (earlier t1130_1200 t1230_1300)
    (earlier t1130_1200 t1300_1330)
    (earlier t1130_1200 t1330_1400)
    (earlier t1130_1200 t1400_1430)
    (earlier t1130_1200 t1430_1500)
    (earlier t1130_1200 t1500_1530)
    (earlier t1130_1200 t1530_1600)
    (earlier t1130_1200 t1600_1630)
    (earlier t1130_1200 t1630_1700)

    (earlier t1200_1230 t1230_1300)
    (earlier t1200_1230 t1300_1330)
    (earlier t1200_1230 t1330_1400)
    (earlier t1200_1230 t1400_1430)
    (earlier t1200_1230 t1430_1500)
    (earlier t1200_1230 t1500_1530)
    (earlier t1200_1230 t1530_1600)
    (earlier t1200_1230 t1600_1630)
    (earlier t1200_1230 t1630_1700)

    (earlier t1230_1300 t1300_1330)
    (earlier t1230_1300 t1330_1400)
    (earlier t1230_1300 t1400_1430)
    (earlier t1230_1300 t1430_1500)
    (earlier t1230_1300 t1500_1530)
    (earlier t1230_1300 t1530_1600)
    (earlier t1230_1300 t1600_1630)
    (earlier t1230_1300 t1630_1700)

    (earlier t1300_1330 t1330_1400)
    (earlier t1300_1330 t1400_1430)
    (earlier t1300_1330 t1430_1500)
    (earlier t1300_1330 t1500_1530)
    (earlier t1300_1330 t1530_1600)
    (earlier t1300_1330 t1600_1630)
    (earlier t1300_1330 t1630_1700)

    (earlier t1330_1400 t1400_1430)
    (earlier t1330_1400 t1430_1500)
    (earlier t1330_1400 t1500_1530)
    (earlier t1330_1400 t1530_1600)
    (earlier t1330_1400 t1600_1630)
    (earlier t1330_1400 t1630_1700)

    (earlier t1400_1430 t1430_1500)
    (earlier t1400_1430 t1500_1530)
    (earlier t1400_1430 t1530_1600)
    (earlier t1400_1430 t1600_1630)
    (earlier t1400_1430 t1630_1700)

    (earlier t1430_1500 t1500_1530)
    (earlier t1430_1500 t1530_1600)
    (earlier t1430_1500 t1600_1630)
    (earlier t1430_1500 t1630_1700)

    (earlier t1500_1530 t1530_1600)
    (earlier t1500_1530 t1600_1630)
    (earlier t1500_1530 t1630_1700)

    (earlier t1530_1600 t1600_1630)
    (earlier t1530_1600 t1630_1700)

    (earlier t1600_1630 t1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled)
      (scheduled t0900_0930)
    )
  )
)