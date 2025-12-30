(define (problem meeting-scheduling-28)
    (:domain meeting-scheduling)
    (:objects
        us ch - location
        joshua - person
        t0 t533 t540 t615 t750 - time-marker ; T750 = 9:30 PM, end of constraints
    )

    (:init
        ; Agent starts at Union Square at 9:00 AM (T0)
        (at us)
        (time-state t0)

        ; Joshua is available at Chinatown (6:00 PM to 9:30 PM)
        (available joshua ch)
    )

    (:goal (met joshua))
)