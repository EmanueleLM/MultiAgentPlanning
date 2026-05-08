(define (problem calendar_scheduling_example_1)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Raymond: Busy 9:00-9:30, 11:30-12:00, 13:00-13:30, 15:00-15:30
    (available raymond t0930_1000)
    (available raymond t1000_1030)
    (available raymond t1030_1100)
    (available raymond t1100_1130)
    (available raymond t1200_1230)
    (available raymond t1230_1300)
    (available raymond t1330_1400)
    (available raymond t1400_1430)
    (available raymond t1430_1500)
    (available raymond t1530_1600)
    (available raymond t1600_1630)
    (available raymond t1630_1700)

    ;; Billy: Busy 10:00-10:30, 12:00-13:00, 16:30-17:00
    ;; Preference: Avoid after 15:00 (15:00-15:30, 15:30-16:00, 16:00-16:30, 16:30-17:00)
    (available billy t0900_0930)
    (available billy t0930_1000)
    (available billy t1030_1100)
    (available billy t1100_1130)
    (available billy t1130_1200)
    (available billy t1300_1330)
    (available billy t1330_1400)
    (available billy t1400_1430)
    (available billy t1430_1500)

    ;; Donald: Busy 9:00-9:30, 10:00-11:00, 12:00-13:00, 14:00-14:30, 16:00-17:00
    (available donald t0930_1000)
    (available donald t1100_1130)
    (available donald t1130_1200)
    (available donald t1300_1330)
    (available donald t1330_1400)
    (available donald t1430_1500)
    (available donald t1500_1530)
    (available donald t1530_1600)
  )
  (:goal
    (meeting_scheduled)
  )
)