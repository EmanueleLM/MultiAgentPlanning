(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - time_slot
  )
  (:init
    ;; Emily's free slots
    (available emily t0900_0930)
    (available emily t0930_1000)
    (available emily t1030_1100)
    (available emily t1100_1130)
    (available emily t1230_1300)
    (available emily t1300_1330)
    (available emily t1330_1400)
    (available emily t1500_1530)
    (available emily t1530_1600)
    (available emily t1630_1700)

    ;; Melissa's free slots
    (available melissa t0900_0930)
    (available melissa t1000_1030)
    (available melissa t1030_1100)
    (available melissa t1100_1130)
    (available melissa t1130_1200)
    (available melissa t1200_1230)
    (available melissa t1230_1300)
    (available melissa t1300_1330)
    (available melissa t1330_1400)
    (available melissa t1400_1430)
    (available melissa t1500_1530)
    (available melissa t1530_1600)
    (available melissa t1600_1630)
    (available melissa t1630_1700)

    ;; Frank's free slots (including his preference/constraint: not after 9:30)
    ;; Calendar free: t0900_0930, t0930_1000, t1030_1100, t1130_1200, t1200_1230, t1300_1330, t1430_1500, t1600_1630
    ;; Constraint: not after 9:30
    (available frank t0900_0930)
  )
  (:goal
    (meeting_scheduled)
  )
)