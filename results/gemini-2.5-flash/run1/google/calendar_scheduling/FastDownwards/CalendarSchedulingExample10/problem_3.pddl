(define (problem calendar_scheduling_instance)
  (:domain calendar_scheduling)
  (:objects
    diana ethan janet - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
  )
  (:init
    ; Ethan is available all day (9:00 to 17:00)
    (available ethan t0900)
    (available ethan t0930)
    (available ethan t1000)
    (available ethan t1030)
    (available ethan t1100)
    (available ethan t1130)
    (available ethan t1200)
    (available ethan t1230)
    (available ethan t1300)
    (available ethan t1330)
    (available ethan t1400)
    (available ethan t1430)
    (available ethan t1500)
    (available ethan t1530)
    (available ethan t1600)
    (available ethan t1630)

    ; Diana's busy slots: 11:30 to 12:00, 13:00 to 13:30
    ; These busy slots are t1130 and t1300. So, we list all others as available.
    (available diana t0900)
    (available diana t0930)
    (available diana t1000)
    (available diana t1030)
    (available diana t1100)
    ; (NOT available diana t1130)
    (available diana t1200)
    (available diana t1230)
    ; (NOT available diana t1300)
    (available diana t1330)
    (available diana t1400)
    (available diana t1430)
    (available diana t1500)
    (available diana t1530)
    (available diana t1600)
    (available diana t1630)

    ; Janet's busy slots: 9:00 to 10:00, 12:30 to 13:00, 14:00 to 15:00, 15:30 to 17:00
    ; Janet's preference: do not want to meet on Monday after 12:00 (i.e., slots starting at or after t1200 are forbidden)
    ; Combining busy times and preference:
    ; Busy: t0900, t0930, t1230, t1400, t1430, t1530, t1600, t1630
    ; Preference: All slots from t1200 onwards are forbidden (t1200, t1230, t1300, t1330, t1400, t1430, t1500, t1530, t1600, t1630)
    ; Available slots for Janet are only those before t1200 and not busy:
    (available janet t1000)
    (available janet t1030)
    (available janet t1100)
    (available janet t1130)
  )
  (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
)