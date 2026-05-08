(define (problem calendar_scheduling_example13_problem)
  (:domain calendar_scheduling_example13)

  (:objects
    monday_0900_0930
    monday_0930_1000
    monday_1000_1030
    monday_1030_1100
    monday_1100_1130
    monday_1130_1200
    monday_1200_1230
    monday_1230_1300
    monday_1300_1330
    monday_1330_1400
    monday_1400_1430
    monday_1430_1500
    monday_1500_1530
    monday_1530_1600
    monday_1600_1630
    monday_1630_1700 - slot
  )

  (:init
    (free gerald monday_0930_1000)
    (free gerald monday_1000_1030)
    (free gerald monday_1030_1100)
    (free gerald monday_1100_1130)
    (free gerald monday_1130_1200)
    (free gerald monday_1200_1230)
    (free gerald monday_1230_1300)
    (free gerald monday_1400_1430)
    (free gerald monday_1430_1500)
    (free gerald monday_1530_1600)

    (free roy monday_0900_0930)
    (free roy monday_0930_1000)
    (free roy monday_1000_1030)
    (free roy monday_1030_1100)
    (free roy monday_1100_1130)
    (free roy monday_1130_1200)
    (free roy monday_1200_1230)
    (free roy monday_1230_1300)
    (free roy monday_1300_1330)
    (free roy monday_1330_1400)
    (free roy monday_1400_1430)
    (free roy monday_1430_1500)
    (free roy monday_1500_1530)
    (free roy monday_1530_1600)
    (free roy monday_1600_1630)
    (free roy monday_1630_1700)

    (free barbara monday_0900_0930)
    (free barbara monday_1000_1030)
    (free barbara monday_1030_1100)
    (free barbara monday_1100_1130)
    (free barbara monday_1400_1430)
    (free barbara monday_1500_1530)

    (candidate_slot monday_1300_1330)
    (candidate_slot monday_1330_1400)
    (candidate_slot monday_1400_1430)
    (candidate_slot monday_1430_1500)
    (candidate_slot monday_1500_1530)
    (candidate_slot monday_1530_1600)
    (candidate_slot monday_1600_1630)
    (candidate_slot monday_1630_1700)
  )

  (:goal
    (or
      (scheduled monday_1300_1330)
      (scheduled monday_1330_1400)
      (scheduled monday_1400_1430)
      (scheduled monday_1430_1500)
      (scheduled monday_1500_1530)
      (scheduled monday_1530_1600)
      (scheduled monday_1600_1630)
      (scheduled monday_1630_1700)
    )
  )
)