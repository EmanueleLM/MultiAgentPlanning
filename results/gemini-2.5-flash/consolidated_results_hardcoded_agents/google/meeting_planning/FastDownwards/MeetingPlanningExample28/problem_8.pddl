(define (problem meeting-scheduling-28)
    (:domain meeting-scheduling)
    (:objects
        us ch - location
        joshua - person
        S0 S1 S2 S3 - stage
    )

    (:init
        ; Start at US at T=0 (9:00 AM)
        (at us)
        (current-stage S0)
        
        ; Joshua availability at CH
        (available joshua ch)
    )

    (:goal (and
        (met joshua)
        (current-stage S3)
    ))
    
    ; Minimize the overall time (makespan) to achieve the goal, which naturally favors the minimum 75-minute meeting.
    (:metric minimize (total-time))
)