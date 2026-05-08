(define (problem meeting-scheduling-28)
    (:domain meeting-scheduling)
    (:objects
        us ch - location
        joshua - person
        p0 p1 p2 p3 - state_flag
    )

    (:init
        ; Start at US at T=0 (9:00 AM)
        (at us)
        (phase p0)
        
        (= (total-cost) 0)

        ; Joshua availability at CH
        (available joshua ch)
    )

    (:goal (and
        (met joshua)
    ))
    
    (:metric minimize (total-cost))
)