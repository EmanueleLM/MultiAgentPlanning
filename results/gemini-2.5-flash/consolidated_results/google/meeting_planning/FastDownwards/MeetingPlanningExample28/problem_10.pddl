(define (problem meeting-scheduling-28)
    (:domain meeting-scheduling)
    (:objects
        us ch - location
        joshua - person
        s0 s1 s2 s3 - stage
    )

    (:init
        ; Start at US at T=0 (9:00 AM)
        (at us)
        (current-stage s0)
        
        ; Joshua availability at CH (6:00 PM to 9:30 PM)
        (available joshua ch)
        
        (= (total-cost) 0) ; Initialize time/cost
    )

    (:goal (and
        (met joshua)
        (current-stage s3)
    ))
    
    ; Minimize the total elapsed time/cost (Total Time = 533 + 7 + 75 = 615 minutes, or 7:15 PM)
    (:metric minimize (total-cost))
)