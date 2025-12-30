(define (problem planning-meeting-margaret)
    (:domain meeting-scheduling)
    
    (:objects
        marina-district pacific-heights - location
    )

    (:init
        ; Initial Location: Marina District
        (at marina-district)
        
        ; Location type identifiers
        (is-marina marina-district)
        (is-pacific-heights pacific-heights)
        
        ; Initial Time: 9:00 AM = 540 minutes
        (= (total-cost) 540)
        
        ; Initial Metric: 0 successful meetings
        (= (total-meetings-successful) 0)
    )

    (:goal (and
        ; Meeting Margaret must be included
        (meeting-successful)
    ))
    
    ; Optimization objective: maximize the number of successful meetings
    (:metric maximize (total-meetings-successful))
)