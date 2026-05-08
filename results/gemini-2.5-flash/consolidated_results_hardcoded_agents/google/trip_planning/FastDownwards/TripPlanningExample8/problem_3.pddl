(define (problem trip-planning-8)
    (:domain trip-planning)
    (:objects
        krakow athens zurich - city
    )
    (:init
        ; Connectivity: Z <-> K, A <-> Z
        (flight zurich krakow)
        (flight krakow zurich)
        (flight athens zurich)
        (flight zurich athens)
        
        ; Start at Athens to enable satisfying the strict D1-D7 stay constraint
        (at athens) 
        
        ; Numeric initial state
        (= (current-day) 1)
        (= (total-trip-duration) 0) 
        (= (stay-krakow-progress) 0)
        (= (stay-athens-progress) 0)
        (= (stay-zurich-progress) 0)
    )
    (:goal (and
        (>= (stay-krakow-progress) 6)
        (>= (stay-athens-progress) 7)
        (>= (stay-zurich-progress) 5)
    ))
    
    ; Minimize the overall trip duration required to fulfill all stays 
    (:metric minimize (total-trip-duration)) 
)