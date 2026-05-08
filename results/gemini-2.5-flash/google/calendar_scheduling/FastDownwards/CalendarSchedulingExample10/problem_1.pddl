(define (problem calendar_scheduling_example10)
    (:domain calendar_scheduling)
    (:objects
        diana ethan janet - person
        t0900 t0930 t1000 t1030 t1100 t1130
        t1200 t1230 t1300 t1330 t1400 t1430
        t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Diana's availability
        (is_available diana t0900)
        (is_available diana t0930)
        (is_available diana t1000)
        (is_available diana t1030)
        (is_available diana t1100)
        ; Diana is busy 11:30 to 12:00 (t1130)
        (is_available diana t1200)
        (is_available diana t1230)
        ; Diana is busy 13:00 to 13:30 (t1300)
        (is_available diana t1330)
        (is_available diana t1400)
        (is_available diana t1430)
        (is_available diana t1500)
        (is_available diana t1530)
        (is_available diana t1600)
        (is_available diana t1630)

        ; Ethan's availability (no meetings the whole day 9:00 to 17:00)
        (is_available ethan t0900)
        (is_available ethan t0930)
        (is_available ethan t1000)
        (is_available ethan t1030)
        (is_available ethan t1100)
        (is_available ethan t1130)
        (is_available ethan t1200)
        (is_available ethan t1230)
        (is_available ethan t1300)
        (is_available ethan t1330)
        (is_available ethan t1400)
        (is_available ethan t1430)
        (is_available ethan t1500)
        (is_available ethan t1530)
        (is_available ethan t1600)
        (is_available ethan t1630)

        ; Janet's availability
        ; Busy slots: 9:00-10:00 (t0900, t0930), 12:30-13:00 (t1230), 14:00-15:00 (t1400, t1430), 15:30-17:00 (t1530, t1600, t1630)
        ; Preference: Not to meet on Monday after 12:00 (meeting must *end* by 12:00).
        ; This means slots starting from t1200 (12:00-12:30) onwards are disallowed.
        ; Janet's available slots, respecting busy times and preference:
        (is_available janet t1000) ; 10:00-10:30
        (is_available janet t1030) ; 10:30-11:00
        (is_available janet t1100) ; 11:00-11:30
        (is_available janet t1130) ; 11:30-12:00
    )
    (:goal (exists (?t - time_slot) (meeting_scheduled ?t)))
)