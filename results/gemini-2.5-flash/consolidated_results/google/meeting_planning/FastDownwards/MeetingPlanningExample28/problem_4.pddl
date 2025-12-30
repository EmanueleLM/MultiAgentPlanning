(define (problem meeting-scheduling-28)
    (:domain meeting-scheduling)
    (:objects
        us ch - location
        joshua - person
        ; T0=9:00 AM, T533=5:53 PM, T540=6:00 PM, T615=7:15 PM, T630=9:30 PM (Max end time)
        t0 t533 t540 t615 t630 - time-marker
    )

    (:init
        ; Agent starts at US at T0 (9:00 AM)
        (at us)
        (time-state t0)

        ; Joshua is available at Chinatown (6:00 PM to 9:30 PM window)
        (available joshua ch)
    )

    (:goal (met joshua))
)