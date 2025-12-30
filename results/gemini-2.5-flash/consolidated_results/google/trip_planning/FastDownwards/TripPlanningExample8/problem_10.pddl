(define (problem TripPlanningProblem)
    (:domain TripPlanning)
    (:objects
        athens zurich krakow - city
    )
    (:init
        ; Initial location (Must start at Athens Day 1 to satisfy D1-D7 constraint)
        (at athens)
        
        ; Connectivity setup: A <-> Z, Z <-> K
        (is-connected zurich krakow)
        (is-connected krakow zurich)
        (is-connected athens zurich)
        (is-connected zurich athens)
        
        ; Time and duration initialization
        (= (current-day) 1) 
        (= (total-cost) 0) 
        
        ; Stay Requirements (A=7, Z=5, K=6)
        (= (stay-A-remaining) 7)
        (= (stay-Z-remaining) 5)
        (= (stay-K-remaining) 6)
    )
    (:goal (and
        (= (stay-A-remaining) 0)
        (= (stay-Z-remaining) 0)
        (= (stay-K-remaining) 0)
    ))
    
    (:metric minimize (total-cost))
)