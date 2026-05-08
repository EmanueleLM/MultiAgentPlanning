(define (problem calendar_problem_24)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Benjamin is free the entire day but does not want to meet after 9:30.
    ;; The 9:00-9:30 slot is the only one that satisfies both.
    (available benjamin t0900_0930)

    ;; Hannah is free the entire day (9:00 to 17:00).
    (available hannah t0900_0930)
    (available hannah t0930_1000)
    (available hannah t1000_1030)
    (available hannah t1030_1100)
    (available hannah t1100_1130)
    (available hannah t1130_1200)
    (available hannah t1200_1230)
    (available hannah t1230_1300)
    (available hannah t1300_1330)
    (available hannah t1330_1400)
    (available hannah t1400_1430)
    (available hannah t1430_1500)
    (available hannah t1500_1530)
    (available hannah t1530_1600)
    (available hannah t1600_1630)
    (available hannah t1630_1700)

    ;; Brenda is busy 9:30 to 10:00, 11:30 to 12:30, 14:00 to 16:30.
    ;; Brenda's free slots (within 9:00 to 17:00):
    (available brenda t0900_0930)
    (available brenda t1000_1030)
    (available brenda t1030_1100)
    (available brenda t1100_1130)
    (available brenda t1230_1300)
    (available brenda t1300_1330)
    (available brenda t1330_1400)
    (available brenda t1630_1700)
  )
  (:goal (meeting_held))
)