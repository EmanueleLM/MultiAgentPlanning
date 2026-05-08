(define (problem calendar_scheduling_problem)
    (:domain calendar_scheduling_example6)
    (:objects
        thomas dylan jerry - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - timeslot
    )
    (:init
        ; Thomas is wide open the entire day (9:00 to 17:00, 1-hour slots)
        (available thomas t0900)
        (available thomas t0930)
        (available thomas t1000)
        (available thomas t1030)
        (available thomas t1100)
        (available thomas t1130)
        (available thomas t1200)
        (available thomas t1230)
        (available thomas t1300)
        (available thomas t1330)
        (available thomas t1400)
        (available thomas t1430)
        (available thomas t1500)
        (available thomas t1530)
        (available thomas t1600)

        ; Dylan is busy 10:30 to 11:00, 13:30 to 14:00
        ; A 1-hour slot [start, start+1h) is unavailable if it overlaps with a busy period [busy_start, busy_end).
        ; Busy [10:30, 11:00): Affects t1000 (10:00-11:00) and t1030 (10:30-11:30)
        ; Busy [13:30, 14:00): Affects t1300 (13:00-14:00) and t1330 (13:30-14:30)
        (available dylan t0900)
        (available dylan t0930)
        ; t1000 (10:00-11:00) conflicts
        ; t1030 (10:30-11:30) conflicts
        (available dylan t1100)
        (available dylan t1130)
        (available dylan t1200)
        (available dylan t1230)
        ; t1300 (13:00-14:00) conflicts
        ; t1330 (13:30-14:30) conflicts
        (available dylan t1400)
        (available dylan t1430)
        (available dylan t1500)
        (available dylan t1530)
        (available dylan t1600)

        ; Jerry is busy 9:00 to 11:00, 11:30 to 14:30, 16:00 to 17:00
        ; Busy [9:00, 11:00): Affects t0900, t0930, t1000, t1030
        ; Busy [11:30, 14:30): Affects t1100, t1130, t1200, t1230, t1300, t1330, t1400
        ; Busy [16:00, 17:00): Affects t1530, t1600
        ; t0900 (9:00-10:00) conflicts
        ; t0930 (9:30-10:30) conflicts
        ; t1000 (10:00-11:00) conflicts
        ; t1030 (10:30-11:30) conflicts
        ; t1100 (11:00-12:00) conflicts
        ; t1130 (11:30-12:30) conflicts
        ; t1200 (12:00-13:00) conflicts
        ; t1230 (12:30-13:30) conflicts
        ; t1300 (13:00-14:00) conflicts
        ; t1330 (13:30-14:30) conflicts
        ; t1400 (14:00-15:00) conflicts
        (available jerry t1430) ; 14:30-15:30 does NOT conflict
        (available jerry t1500) ; 15:00-16:00 does NOT conflict
        ; t1530 (15:30-16:30) conflicts
        ; t1600 (16:00-17:00) conflicts

        ; Initial state: no meeting scheduled
    )
    (:goal (and
        (meeting_scheduled)
    ))
)