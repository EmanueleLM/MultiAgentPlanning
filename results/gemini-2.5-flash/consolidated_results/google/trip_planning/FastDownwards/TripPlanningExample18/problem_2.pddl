(define (problem trip-planning-18)
    (:domain trip-planning)
    (:objects
        amsterdam vilnius bucharest - city
    )
    
    (:init
        ; Connections: AMS <-> BUC, VNO <-> AMS
        (connected amsterdam bucharest)
        (connected bucharest amsterdam)
        (connected vilnius amsterdam)
        (connected amsterdam vilnius)
        
        ; Initial State: Start at Vilnius
        (at vilnius) 
        (visited vilnius) 
        
        ; Initial values
        (= (day-counter) 0)
        (= (days-stayed amsterdam) 0)
        (= (days-stayed vilnius) 0)
        (= (days-stayed bucharest) 0)
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Hard Constraints
        (= (day-counter) 11) ; Total duration must be 11 days
        (visited amsterdam)
        (visited vilnius)
        (visited bucharest)
        (meeting_achieved)
    ))
    
    (:metric minimize (total-cost))
)