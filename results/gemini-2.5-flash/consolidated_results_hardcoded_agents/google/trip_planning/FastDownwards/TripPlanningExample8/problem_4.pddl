(define (problem trip-planning-8)
    (:domain trip-planning)
    (:objects
        krakow athens zurich - city
    )
    (:init
        (flight zurich krakow)
        (flight krakow zurich)
        (flight athens zurich)
        (flight zurich athens)
        
        (at athens) 
        
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
    
    (:metric minimize (total-trip-duration)) 
)