(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Gregory's busy slots
    (is_busy gregory t1100_1130)
    (is_busy gregory t1200_1230)
    (is_busy gregory t1530_1600)
    (is_busy gregory t1600_1630)

    ;; Carol's busy slots
    (is_busy carol t0900_0930)
    (is_busy carol t0930_1000)
    (is_busy carol t1000_1030)
    (is_busy carol t1100_1130)
    (is_busy carol t1130_1200)
    (is_busy carol t1200_1230)
    (is_busy carol t1230_1300)
    (is_busy carol t1300_1330)
    (is_busy carol t1330_1400)
    (is_busy carol t1400_1430)
    (is_busy carol t1430_1500)
    (is_busy carol t1500_1530)
    (is_busy carol t1530_1600)
    (is_busy carol t1630_1700)

    ;; Teresa is wide open, so no busy predicates for her.
  )
  (:goal (meeting_scheduled))
)