(define (problem cs7-problem)
    (:domain calendar-scheduling-7)
    (:objects
        T900 T930 T1000 T1030 T1100 T1130 T1200 T1230 T1300 T1330 T1400 T1430 T1500 T1530 T1600 T1630 - time
    )
    (:init
        (= (total-cost) 0)

        ; --- Zachary's Non-Preferred Times (Starts 14:00 onwards) ---
        (is-nonpreferred T1400)
        (is-nonpreferred T1430)
        (is-nonpreferred T1500)
        (is-nonpreferred T1530)
        (is-nonpreferred T1600)
        (is-nonpreferred T1630)

        ; --- Heather Availability (Based on blocks: 9:00-9:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30) ---
        (is-available heather T930)
        (is-available heather T1000)
        (is-available heather T1100)
        (is-available heather T1130)
        (is-available heather T1200)
        (is-available heather T1230)
        (is-available heather T1400)
        (is-available heather T1500)
        (is-available heather T1530)
        (is-available heather T1630)

        ; --- Nicholas Availability (All slots 9:00 to 16:30) ---
        (is-available nicholas T900)
        (is-available nicholas T930)
        (is-available nicholas T1000)
        (is-available nicholas T1030)
        (is-available nicholas T1100)
        (is-available nicholas T1130)
        (is-available nicholas T1200)
        (is-available nicholas T1230)
        (is-available nicholas T1300)
        (is-available nicholas T1330)
        (is-available nicholas T1400)
        (is-available nicholas T1430)
        (is-available nicholas T1500)
        (is-available nicholas T1530)
        (is-available nicholas T1600)
        (is-available nicholas T1630)

        ; --- Zachary Availability (Based on blocks: 9:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30. Note: All available times are preferred/before 14:00) ---
        (is-available zachary T1030)
        (is-available zachary T1200)
        (is-available zachary T1300)
    )
    (:goal (meeting-found))
    (:metric minimize (total-cost))
)