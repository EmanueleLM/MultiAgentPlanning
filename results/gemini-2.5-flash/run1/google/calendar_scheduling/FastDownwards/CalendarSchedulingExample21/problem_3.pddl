(define (problem calendar_scheduling_example21)
    (:domain calendar_scheduling)
    (:objects
        BOBBY SCOTT KIMBERLY - participant
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_point
    )
    (:init
        ; --- Global state ---
        (meeting_not_yet_scheduled)

        ; --- Time ordering ---
        (next_time t0900 t0930)
        (next_time t0930 t1000)
        (next_time t1000 t1030)
        (next_time t1030 t1100)
        (next_time t1100 t1130)
        (next_time t1130 t1200)
        (next_time t1200 t1230)
        (next_time t1230 t1300)
        (next_time t1300 t1330)
        (next_time t1330 t1400)
        (next_time t1400 t1430)
        (next_time t1430 t1500)
        (next_time t1500 t1530)
        (next_time t1530 t1600)
        (next_time t1600 t1630)

        ; --- BOBBY's availability (wide open 9:00 to 17:00) ---
        (available BOBBY t0900)
        (available BOBBY t0930)
        (available BOBBY t1000)
        (available BOBBY t1030)
        (available BOBBY t1100)
        (available BOBBY t1130)
        (available BOBBY t1200)
        (available BOBBY t1230)
        (available BOBBY t1300)
        (available BOBBY t1330)
        (available BOBBY t1400)
        (available BOBBY t1430)
        (available BOBBY t1500)
        (available BOBBY t1530)
        (available BOBBY t1600)
        (available BOBBY t1630)

        ; --- SCOTT's availability (busy 11:30-12:00, 15:30-16:00) ---
        (available SCOTT t0900)
        (available SCOTT t0930)
        (available SCOTT t1000)
        (available SCOTT t1030)
        (available SCOTT t1100)
        ; t1130 (11:30-12:00) is busy, so (available SCOTT t1130) is omitted
        (available SCOTT t1200)
        (available SCOTT t1230)
        (available SCOTT t1300)
        (available SCOTT t1330)
        (available SCOTT t1400)
        (available SCOTT t1430)
        (available SCOTT t1500)
        ; t1530 (15:30-16:00) is busy, so (available SCOTT t1530) is omitted
        (available SCOTT t1600)
        (available SCOTT t1630)

        ; --- KIMBERLY's availability (busy 11:00-12:00, 12:30-13:00, 13:30-14:00, 14:30-15:00, 15:30-17:00) ---
        (available KIMBERLY t0900)
        (available KIMBERLY t0930)
        (available KIMBERLY t1000)
        (available KIMBERLY t1030)
        ; t1100-12:00 (t1100, t1130) are busy, so (available KIMBERLY t1100) and (available KIMBERLY t1130) are omitted
        (available KIMBERLY t1200)
        ; t1230-13:00 (t1230) is busy, so (available KIMBERLY t1230) is omitted
        (available KIMBERLY t1300)
        ; t1330-14:00 (t1330) is busy, so (available KIMBERLY t1330) is omitted
        (available KIMBERLY t1400)
        (available KIMBERLY t1430)
        ; t1430-15:00 (t1430) is busy, so (available KIMBERLY t1430) is omitted
        (available KIMBERLY t1500)
        ; t1530-17:00 (t1530, t1600, t1630) are busy, so (available KIMBERLY t1530), (available KIMBERLY t1600), (available KIMBERLY t1630) are omitted
    )
    (:goal
        (exists (?s - time_point) (meeting_scheduled ?s))
    )
)