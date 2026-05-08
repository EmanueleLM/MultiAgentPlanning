(define (problem calendarschedulingexample24)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Benjamin is free but doesn't want to meet after 9:30. 
    ;; A 30-min meeting starting at 9:00 ends at 9:30.
    (available benjamin t0900)

    ;; Hannah is free all day from 9:00 to 17:00.
    (available hannah t0900)
    (available hannah t0930)
    (available hannah t1000)
    (available hannah t1030)
    (available hannah t1100)
    (available hannah t1130)
    (available hannah t1200)
    (available hannah t1230)
    (available hannah t1300)
    (available hannah t1330)
    (available hannah t1400)
    (available hannah t1430)
    (available hannah t1500)
    (available hannah t1530)
    (available hannah t1600)
    (available hannah t1630)

    ;; Brenda has meetings: 9:30-10:00, 11:30-12:30, 14:00-16:30.
    ;; Her free slots:
    (available brenda t0900)
    ;; 9:30-10:00 (t0930) busy
    (available brenda t1000)
    (available brenda t1030)
    (available brenda t1100)
    ;; 11:30-12:30 (t1130, t1200) busy
    (available brenda t1230)
    (available brenda t1300)
    (available brenda t1330)
    ;; 14:00-16:30 (t1400, t1430, t1500, t1530, t1600) busy
    (available brenda t1630)
  )
  (:goal (meeting_scheduled))
)