(define (problem schedule_1)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200
    t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Raymond is busy: 9:00-9:30, 11:30-12:00, 13:00-13:30, 15:00-15:30
    (free raymond t0930_1000)
    (free raymond t1000_1030)
    (free raymond t1030_1100)
    (free raymond t1100_1130)
    (free raymond t1200_1230)
    (free raymond t1230_1300)
    (free raymond t1330_1400)
    (free raymond t1400_1430)
    (free raymond t1430_1500)
    (free raymond t1530_1600)
    (free raymond t1600_1630)
    (free raymond t1630_1700)

    ;; Billy is busy: 10:00-10:30, 12:00-13:00, 16:30-17:00
    ;; Billy preference: no meetings after 15:00 (15:00-17:00 excluded)
    (free billy t0900_0930)
    (free billy t0930_1000)
    (free billy t1030_1100)
    (free billy t1100_1130)
    (free billy t1130_1200)
    (free billy t1300_1330)
    (free billy t1330_1400)
    (free billy t1400_1430)
    (free billy t1430_1500)

    ;; Donald is busy: 9:00-9:30, 10:00-11:00, 12:00-13:00, 14:00-14:30, 16:00-17:00
    (free donald t0930_1000)
    (free donald t1100_1130)
    (free donald t1130_1200)
    (free donald t1300_1330)
    (free donald t1330_1400)
    (free donald t1430_1500)
    (free donald t1500_1530)
    (free donald t1530_1600)
  )
  (:goal (scheduled))
)