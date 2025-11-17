(define (problem schedule_problem)
  (:domain meeting_schedule)
  (:objects
    slot_0900_1000 slot_0930_1030 slot_1000_1100 slot_1030_1130 slot_1100_1200
    slot_1130_1230 slot_1200_1300 slot_1230_1330 slot_1300_1400 slot_1330_1430
    slot_1400_1500 slot_1430_1530 slot_1500_1600 slot_1530_1630 slot_1600_1700 - slot
  )
  (:init
    (available arthur slot_0930_1030)
    (available arthur slot_1200_1300)
    (available arthur slot_1230_1330)
    (available arthur slot_1300_1400)
    (available arthur slot_1330_1430)
    (available arthur slot_1400_1500)
    (available arthur slot_1430_1530)
    (available arthur slot_1500_1600)

    (available michael slot_0900_1000)
    (available michael slot_0930_1030)
    (available michael slot_1000_1100)
    (available michael slot_1030_1130)
    (available michael slot_1100_1200)
    (available michael slot_1130_1230)
    (available michael slot_1200_1300)
    (available michael slot_1430_1530)
    (available michael slot_1500_1600)
    (available michael slot_1530_1630)
    (available michael slot_1600_1700)

    (available samantha slot_0900_1000)
    (available samantha slot_0930_1030)
    (available samantha slot_1100_1200)
  )
  (:goal (and (scheduled)))
)