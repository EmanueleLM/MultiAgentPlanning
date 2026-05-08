(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    ;; Hannah is free all day
    (free hannah t0900)
    (free hannah t0930)
    (free hannah t1000)
    (free hannah t1030)
    (free hannah t1100)
    (free hannah t1130)
    (free hannah t1200)
    (free hannah t1230)
    (free hannah t1300)
    (free hannah t1330)
    (free hannah t1400)
    (free hannah t1430)
    (free hannah t1500)
    (free hannah t1530)
    (free hannah t1600)
    (free hannah t1630)

    ;; Benjamin is free the entire day but won't meet after 9:30.
    ;; Only the slot starting at 9:00 and ending at 9:30 satisfies this constraint.
    (free benjamin t0900)

    ;; Brenda has meetings on Monday during 9:30 to 10:00, 11:30 to 12:30, 14:00 to 16:30.
    ;; Her free slots:
    (free brenda t0900) ;; 9:00 to 9:30
    ;; 9:30 to 10:00 is busy
    (free brenda t1000) ;; 10:00 to 10:30
    (free brenda t1030) ;; 10:30 to 11:00
    (free brenda t1100) ;; 11:00 to 11:30
    ;; 11:30 to 12:30 is busy (t1130, t1200)
    (free brenda t1230) ;; 12:30 to 13:00
    (free brenda t1300) ;; 13:00 to 13:30
    (free brenda t1330) ;; 13:30 to 14:00
    ;; 14:00 to 16:30 is busy (t1400, t1430, t1500, t1530, t1600)
    (free brenda t1630) ;; 16:30 to 17:00
  )
  (:goal (meeting_scheduled))
)