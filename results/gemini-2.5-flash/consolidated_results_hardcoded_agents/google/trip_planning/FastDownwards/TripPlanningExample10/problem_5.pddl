(define (problem trip-planning-10-p)
    (:domain trip-planning-10)
    
    ; Cities are defined as constants in the domain, so no objects needed here.

    (:init
        ;; Connections (O<->D, D<->V)
        (connection oslo dublin)
        (connection dublin oslo)
        (connection dublin valencia)
        (connection valencia dublin)

        ;; Initial state fluents
        (= (days-spent) 0)
        (= (duration-o) 0)
        (= (duration-d) 0)
        (= (duration-v) 0)
        (= (current-cost) 0)
        
        ;; Initial status flags
        (not (started-trip))
        (not (allocation-complete))
    )
    (:goal (and
        (at valencia)
        (visited oslo)
        (visited dublin)
        (visited valencia)
        (= (days-spent) 9)
    ))
    (:metric minimize (current-cost))
)