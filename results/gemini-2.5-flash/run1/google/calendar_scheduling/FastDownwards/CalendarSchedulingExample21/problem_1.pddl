(define (problem calendar_scheduling_example21)
    (:domain calendar_scheduling)
    (:objects
        bobby scott kimberly - participant
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_point
    )
    (:init
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

        ; --- Bobby's availability (wide open 9:00 to 17:00) ---
        (available bobby t0900)
        (available bobby t0930)
        (available bobby t1000)
        (available bobby t1030)
        (available bobby t1100)
        (available bobby t1130)
        (available bobby t1200)
        (available bobby t1230)
        (available bobby t1300)
        (available bobby t1330)
        (available bobby t1400)
        (available bobby t1430)
        (available bobby t1500)
        (available bobby t1530)
        (available bobby t1600)
        (available bobby t1630)

        ; --- Scott's availability (busy 11:30-12:00, 15:30-16:00) ---
        (available scott t0900)
        (available scott t0930)
        (available scott t1000)
        (available scott t1030)
        (available scott t1100)
        ; t1130-12:00 (t1130) is busy
        (available scott t1200)
        (available scott t1230)
        (available scott t1300)
        (available scott t1330)
        (available scott t1400)
        (available scott t1430)
        (available scott t1500)
        ; t1530-16:00 (t1530) is busy
        (available scott t1600)
        (available scott t1630)

        ; --- Kimberly's availability (busy 11:00-12:00, 12:30-13:00, 13:30-14:00, 14:30-15:00, 15:30-17:00) ---
        (available kimberly t0900)
        (available kimberly t0930)
        (available kimberly t1000)
        (available kimberly t1030)
        ; t1100-12:00 (t1100, t1130) are busy
        (available kimberly t1200)
        ; t1230-13:00 (t1230) is busy
        (available kimberly t1300)
        ; t1330-14:00 (t1330) is busy
        (available kimberly t1400)
        ; t1430-15:00 (t1430) is busy
        (available kimberly t1500)
        ; t1530-17:00 (t1530, t1600, t1630) are busy
    )
    (:goal
        (exists (?s - time_point) (meeting_scheduled ?s))
    )
)