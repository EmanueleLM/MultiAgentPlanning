(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    diana ethan janet - participant
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - time_slot
  )
  (:init
    ;; Diana's availability (Busy 11:30-12:00, 13:00-13:30)
    (available diana t0900_0930)
    (available diana t0930_1000)
    (available diana t1000_1030)
    (available diana t1030_1100)
    (available diana t1100_1130)
    (available diana t1200_1230)
    (available diana t1230_1300)
    (available diana t1330_1400)
    (available diana t1400_1430)
    (available diana t1430_1500)
    (available diana t1500_1530)
    (available diana t1530_1600)
    (available diana t1600_1630)
    (available diana t1630_1700)

    ;; Ethan's availability (No meetings the whole day)
    (available ethan t0900_0930)
    (available ethan t0930_1000)
    (available ethan t1000_1030)
    (available ethan t1030_1100)
    (available ethan t1100_1130)
    (available ethan t1130_1200)
    (available ethan t1200_1230)
    (available ethan t1230_1300)
    (available ethan t1300_1330)
    (available ethan t1330_1400)
    (available ethan t1400_1430)
    (available ethan t1430_1500)
    (available ethan t1500_1530)
    (available ethan t1530_1600)
    (available ethan t1600_1630)
    (available ethan t1630_1700)

    ;; Janet's availability
    ;; Busy: 09:00-10:00, 12:30-13:00, 14:00-15:00, 15:30-17:00
    ;; Preference/Constraint: No meeting after 12:00
    ;; Available slots remaining: 10:00-12:00
    (available janet t1000_1030)
    (available janet t1030_1100)
    (available janet t1100_1130)
    (available janet t1130_1200)
  )
  (:goal (meeting_scheduled))
)