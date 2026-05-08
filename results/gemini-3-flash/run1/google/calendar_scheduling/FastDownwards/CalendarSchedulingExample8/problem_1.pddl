(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    (is_busy adam t1000_1030)
    (is_busy adam t1230_1300)
    (is_busy adam t1330_1400)
    (is_busy adam t1400_1430)
    (is_busy jerry t0900_0930)
    (is_busy jerry t1200_1230)
    (is_busy jerry t1500_1530)
    (is_busy jerry t1530_1600)
    (is_busy matthew t0930_1000)
    (is_busy matthew t1000_1030)
    (is_busy matthew t1030_1100)
    (is_busy matthew t1130_1200)
    (is_busy matthew t1200_1230)
    (is_busy matthew t1300_1330)
    (is_busy matthew t1330_1400)
    (is_busy matthew t1430_1500)
    (is_busy matthew t1500_1530)
    (is_busy matthew t1530_1600)
    (is_busy matthew t1600_1630)
    (is_busy matthew t1630_1700)
  )
  (:goal (meeting_scheduled))
)