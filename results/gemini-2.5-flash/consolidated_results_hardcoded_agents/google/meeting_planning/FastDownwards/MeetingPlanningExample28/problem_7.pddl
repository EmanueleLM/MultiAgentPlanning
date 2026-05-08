(define (problem meeting-scheduling-28)
    (:domain meeting-scheduling)
    (:objects
        us ch - location
        joshua - person
        phase-0 phase-1 phase-2 phase-3 - state_flag
    )

    (:init
        ; Start at US at T=0 (9:00 AM)
        (at us)
        (phase phase-0)
        
        (= (total-cost) 0)

        ; Joshua availability at CH
        (available joshua ch)
    )

    (:goal (and
        (met joshua)
    ))
    
    (:metric minimize (total-cost))