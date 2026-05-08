(define (problem calendar_scheduling_example10)
    (:domain calendar_scheduling)
    (:objects
        diana ethan janet - person
        t0900 t0930 t1000 t1030 t1100 t1130
        t1200 t1230 t1300 t1330 t1400 t1430
        t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Diana's availability (busy 11:30-12:00, 13:00-13:30)
        (is_available diana t0900)
        (is_available diana t0930)
        (is_available diana t1000)
        (is_available diana t1030)
        (is_available diana t1100)
        ; t1130 (11:30-12:00) - Diana busy
        (is_available diana t1200)
        (is_available diana t1230)
        ; t1300 (13:00-13:30) - Diana busy
        (is_available diana t1330)
        (is_available diana t1400)
        (is_available diana t1430)
        (is_available diana t1500)
        (is_available diana t1530)
        (is_available diana t1600)
        (is_available diana t1630)

        ; Ethan's availability (no meetings the whole day)
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

        ; Janet's availability (busy 9:00-10:00, 12:30-13:00, 14:00-15:00, 15:30-17:00)
        ; and preference (not after 12:00, meaning slots starting >= 12:00 are disallowed)
        ; t0900, t0930 (9:00-10:00) - Janet busy
        (is_available janet t1000)
        (is_available janet t1030)
        (is_available janet t1100)
        (is_available janet t1130)
        ; t1200 (12:00-12:30) - Janet's preference: not after 12:00
        ; t1230 (12:30-13:00) - Janet busy AND preference
        ; All subsequent slots are also disallowed by preference
    )
    (:goal (exists (?t - time_slot) (meeting_scheduled ?t)))
)