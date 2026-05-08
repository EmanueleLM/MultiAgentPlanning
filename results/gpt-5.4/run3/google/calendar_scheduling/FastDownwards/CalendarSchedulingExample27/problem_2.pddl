(define (problem calendar_scheduling_example27_problem)
  (:domain calendar_scheduling_example27)

  (:objects
    jesse kathryn megan - participant
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
    (free jesse t_0900_0930)
    (free jesse t_0930_1000)
    (free jesse t_1030_1100)
    (free jesse t_1100_1130)
    (free jesse t_1130_1200)
    (free jesse t_1200_1230)
    (free jesse t_1230_1300)
    (free jesse t_1300_1330)
    (free jesse t_1330_1400)
    (free jesse t_1400_1430)
    (free jesse t_1430_1500)
    (free jesse t_1500_1530)
    (free jesse t_1600_1630)
    (free jesse t_1630_1700)

    (free kathryn t_0900_0930)
    (free kathryn t_0930_1000)
    (free kathryn t_1000_1030)
    (free kathryn t_1030_1100)
    (free kathryn t_1100_1130)
    (free kathryn t_1130_1200)
    (free kathryn t_1200_1230)
    (free kathryn t_1230_1300)
    (free kathryn t_1300_1330)
    (free kathryn t_1330_1400)
    (free kathryn t_1400_1430)
    (free kathryn t_1430_1500)
    (free kathryn t_1500_1530)
    (free kathryn t_1530_1600)
    (free kathryn t_1600_1630)
    (free kathryn t_1630_1700)

    (free megan t_0900_0930)
    (free megan t_0930_1000)
    (free megan t_1000_1030)
    (free megan t_1100_1130)
    (free megan t_1230_1300)
    (free megan t_1300_1330)
    (free megan t_1430_1500)
    (free megan t_1630_1700)

    (earlier t_0900_0930 t_0930_1000)
    (earlier t_0900_0930 t_1000_1030)
    (earlier t_0900_0930 t_1030_1100)
    (earlier t_0900_0930 t_1100_1130)
    (earlier t_0900_0930 t_1130_1200)
    (earlier t_0900_0930 t_1200_1230)
    (earlier t_0900_0930 t_1230_1300)
    (earlier t_0900_0930 t_1300_1330)
    (earlier t_0900_0930 t_1330_1400)
    (earlier t_0900_0930 t_1400_1430)
    (earlier t_0900_0930 t_1430_1500)
    (earlier t_0900_0930 t_1500_1530)
    (earlier t_0900_0930 t_1530_1600)
    (earlier t_0900_0930 t_1600_1630)
    (earlier t_0900_0930 t_1630_1700)

    (earlier t_0930_1000 t_1000_1030)
    (earlier t_0930_1000 t_1030_1100)
    (earlier t_0930_1000 t_1100_1130)
    (earlier t_0930_1000 t_1130_1200)
    (earlier t_0930_1000 t_1200_1230)
    (earlier t_0930_1000 t_1230_1300)
    (earlier t_0930_1000 t_1300_1330)
    (earlier t_0930_1000 t_1330_1400)
    (earlier t_0930_1000 t_1400_1430)
    (earlier t_0930_1000 t_1430_1500)
    (earlier t_0930_1000 t_1500_1530)
    (earlier t_0930_1000 t_1530_1600)
    (earlier t_0930_1000 t_1600_1630)
    (earlier t_0930_1000 t_1630_1700)

    (earlier t_1000_1030 t_1030_1100)
    (earlier t_1000_1030 t_1100_1130)
    (earlier t_1000_1030 t_1130_1200)
    (earlier t_1000_1030 t_1200_1230)
    (earlier t_1000_1030 t_1230_1300)
    (earlier t_1000_1030 t_1300_1330)
    (earlier t_1000_1030 t_1330_1400)
    (earlier t_1000_1030 t_1400_1430)
    (earlier t_1000_1030 t_1430_1500)
    (earlier t_1000_1030 t_1500_1530)
    (earlier t_1000_1030 t_1530_1600)
    (earlier t_1000_1030 t_1600_1630)
    (earlier t_1000_1030 t_1630_1700)

    (earlier t_1030_1100 t_1100_1130)
    (earlier t_1030_1100 t_1130_1200)
    (earlier t_1030_1100 t_1200_1230)
    (earlier t_1030_1100 t_1230_1300)
    (earlier t_1030_1100 t_1300_1330)
    (earlier t_1030_1100 t_1330_1400)
    (earlier t_1030_1100 t_1400_1430)
    (earlier t_1030_1100 t_1430_1500)
    (earlier t_1030_1100 t_1500_1530)
    (earlier t_1030_1100 t_1530_1600)
    (earlier t_1030_1100 t_1600_1630)
    (earlier t_1030_1100 t_1630_1700)

    (earlier t_1100_1130 t_1130_1200)
    (earlier t_1100_1130 t_1200_1230)
    (earlier t_1100_1130 t_1230_1300)
    (earlier t_1100_1130 t_1300_1330)
    (earlier t_1100_1130 t_1330_1400)
    (earlier t_1100_1130 t_1400_1430)
    (earlier t_1100_1130 t_1430_1500)
    (earlier t_1100_1130 t_1500_1530)
    (earlier t_1100_1130 t_1530_1600)
    (earlier t_1100_1130 t_1600_1630)
    (earlier t_1100_1130 t_1630_1700)

    (earlier t_1130_1200 t_1200_1230)
    (earlier t_1130_1200 t_1230_1300)
    (earlier t_1130_1200 t_1300_1330)
    (earlier t_1130_1200 t_1330_1400)
    (earlier t_1130_1200 t_1400_1430)
    (earlier t_1130_1200 t_1430_1500)
    (earlier t_1130_1200 t_1500_1530)
    (earlier t_1130_1200 t_1530_1600)
    (earlier t_1130_1200 t_1600_1630)
    (earlier t_1130_1200 t_1630_1700)

    (earlier t_1200_1230 t_1230_1300)
    (earlier t_1200_1230 t_1300_1330)
    (earlier t_1200_1230 t_1330_1400)
    (earlier t_1200_1230 t_1400_1430)
    (earlier t_1200_1230 t_1430_1500)
    (earlier t_1200_1230 t_1500_1530)
    (earlier t_1200_1230 t_1530_1600)
    (earlier t_1200_1230 t_1600_1630)
    (earlier t_1200_1230 t_1630_1700)

    (earlier t_1230_1300 t_1300_1330)
    (earlier t_1230_1300 t_1330_1400)
    (earlier t_1230_1300 t_1400_1430)
    (earlier t_1230_1300 t_1430_1500)
    (earlier t_1230_1300 t_1500_1530)
    (earlier t_1230_1300 t_1530_1600)
    (earlier t_1230_1300 t_1600_1630)
    (earlier t_1230_1300 t_1630_1700)

    (earlier t_1300_1330 t_1330_1400)
    (earlier t_1300_1330 t_1400_1430)
    (earlier t_1300_1330 t_1430_1500)
    (earlier t_1300_1330 t_1500_1530)
    (earlier t_1300_1330 t_1530_1600)
    (earlier t_1300_1330 t_1600_1630)
    (earlier t_1300_1330 t_1630_1700)

    (earlier t_1330_1400 t_1400_1430)
    (earlier t_1330_1400 t_1430_1500)
    (earlier t_1330_1400 t_1500_1530)
    (earlier t_1330_1400 t_1530_1600)
    (earlier t_1330_1400 t_1600_1630)
    (earlier t_1330_1400 t_1630_1700)

    (earlier t_1400_1430 t_1430_1500)
    (earlier t_1400_1430 t_1500_1530)
    (earlier t_1400_1430 t_1530_1600)
    (earlier t_1400_1430 t_1600_1630)
    (earlier t_1400_1430 t_1630_1700)

    (earlier t_1430_1500 t_1500_1530)
    (earlier t_1430_1500 t_1530_1600)
    (earlier t_1430_1500 t_1600_1630)
    (earlier t_1430_1500 t_1630_1700)

    (earlier t_1500_1530 t_1530_1600)
    (earlier t_1500_1530 t_1600_1630)
    (earlier t_1500_1530 t_1630_1700)

    (earlier t_1530_1600 t_1600_1630)
    (earlier t_1530_1600 t_1630_1700)

    (earlier t_1600_1630 t_1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled)
      (chosen t_0900_0930))
  )
)