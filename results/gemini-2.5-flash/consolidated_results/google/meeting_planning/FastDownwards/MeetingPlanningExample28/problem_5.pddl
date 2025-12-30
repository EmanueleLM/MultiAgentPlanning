(define (problem meeting-scheduling-28)
    (:domain meeting-scheduling-temporal)
    (:objects
        us ch - location
        joshua - person
    )

    (:init
        ; Agent starts at US at T=0 (9:00 AM)
        (at us)
        (= (total-time) 0)

        ; Define all temporal constraints as fluents
        (= (joshua-start-time) 540) ; 6:00 PM
        (= (joshua-end-time) 750)   ; 9:30 PM
        (= (travel-duration) 7)
        (= (min-meet-duration) 75)

        ; Joshua availability
        (available joshua ch)
    )

    (:goal (and
        (met joshua)
    ))
)