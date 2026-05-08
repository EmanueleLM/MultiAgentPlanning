(define (problem calendar_scheduling_example_40_problem)
  (:domain calendar_scheduling_example_40)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )
  (:init
    (next t0900_0930 t0930_1000)
    (next t0930_1000 t1000_1030)
    (next t1000_1030 t1030_1100)
    (next t1030_1100 t1100_1130)
    (next t1100_1130 t1130_1200)
    (next t1130_1200 t1200_1230)
    (next t1200_1230 t1230_1300)
    (next t1230_1300 t1300_1330)
    (next t1300_1330 t1330_1400)
    (next t1330_1400 t1400_1430)
    (next t1400_1430 t1430_1500)
    (next t1430_1500 t1500_1530)
    (next t1500_1530 t1530_1600)
    (next t1530_1600 t1600_1630)
    (next t1600_1630 t1630_1700)
    
    ;; A slot is available if all participants (Jacob, Gabriel, Matthew) are free.
    ;; Intersection of free times for all participants:
    (available t1200_1230)
    (available t1400_1430)
    (available t1430_1500)
    (available t1630_1700)
  )
  (:goal (meeting_scheduled))
)