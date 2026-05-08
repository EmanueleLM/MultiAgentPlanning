(define (problem trip-planning-8)
    (:domain trip-planning)
    (:objects
        KRAKOW ATHENS ZURICH - city
    )
    (:init
        (flight ZURICH KRAKOW)
        (flight KRAKOW ZURICH)
        (flight ATHENS ZURICH)
        (flight ZURICH ATHENS)
        
        (at ATHENS) 
        
        (= (current-day) 1)
        (= (total-cost) 0) 
        (= (stay-krakow-progress) 0)
        (= (stay-athens-progress) 0)
        (= (stay-zurich-progress) 0)
    )
    (:goal (and
        (>= (stay-krakow-progress) 6)
        (>= (stay-athens-progress) 7)
        (>= (stay-zurich-progress) 5)
    ))
    
    (:metric minimize (total-cost))
)