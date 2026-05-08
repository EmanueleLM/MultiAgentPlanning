(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    slot_0900_0930
    slot_0930_1000
    slot_1000_1030
    slot_1030_1100
    slot_1100_1130
    slot_1130_1200
    slot_1200_1230
    slot_1230_1300
    slot_1300_1330
    slot_1330_1400
    slot_1400_1430
    slot_1430_1500
    slot_1500_1530
    slot_1530_1600
    slot_1600_1630
    slot_1630_1700 - slot
  )
  (:init
    ;; David is free all day
    (available david slot_0900_0930)
    (available david slot_0930_1000)
    (available david slot_1000_1030)
    (available david slot_1030_1100)
    (available david slot_1100_1130)
    (available david slot_1130_1200)
    (available david slot_1200_1230)
    (available david slot_1230_1300)
    (available david slot_1300_1330)
    (available david slot_1330_1400)
    (available david slot_1400_1430)
    (available david slot_1430_1500)
    (available david slot_1500_1530)
    (available david slot_1530_1600)
    (available david slot_1600_1630)
    (available david slot_1630_1700)

    ;; Eric busy 9:00-9:30, 10:30-11:30, 15:00-15:30
    (available eric slot_0930_1000)
    (available eric slot_1000_1030)
    (available eric slot_1130_1200)
    (available eric slot_1200_1230)
    (available eric slot_1230_1300)
    (available eric slot_1300_1330)
    (available eric slot_1330_1400)
    (available eric slot_1400_1430)
    (available eric slot_1430_1500)
    (available eric slot_1530_1600)
    (available eric slot_1600_1630)
    (available eric slot_1630_1700)

    ;; Roger busy 9:30-10:30, 11:00-12:00, 12:30-13:00, 14:30-15:00, 15:30-16:30
    (available roger slot_0900_0930)
    (available roger slot_1030_1100)
    (available roger slot_1200_1230)
    (available roger slot_1300_1330)
    (available roger slot_1330_1400)
    (available roger slot_1400_1430)
    (available roger slot_1500_1530)
    (available roger slot_1630_1700)

    ;; Define consecutive slots
    (consecutive slot_0900_0930 slot_0930_1000)
    (consecutive slot_0930_1000 slot_1000_1030)
    (consecutive slot_1000_1030 slot_1030_1100)
    (consecutive slot_1030_1100 slot_1100_1130)
    (consecutive slot_1100_1130 slot_1130_1200)
    (consecutive slot_1130_1200 slot_1200_1230)
    (consecutive slot_1200_1230 slot_1230_1300)
    (consecutive slot_1230_1300 slot_1300_1330)
    (consecutive slot_1300_1330 slot_1330_1400)
    (consecutive slot_1330_1400 slot_1400_1430)
    (consecutive slot_1400_1430 slot_1430_1500)
    (consecutive slot_1430_1500 slot_1500_1530)
    (consecutive slot_1500_1530 slot_1530_1600)
    (consecutive slot_1530_1600 slot_1600_1630)
    (consecutive slot_1600_1630 slot_1630_1700)
  )
  (:goal (meeting_scheduled))
)