(define (problem meeting-scheduling)
    (:domain meeting-planning)
    (:objects
        ;; margaret is now a constant in the domain
    )
    (:init
        ;; Planner starts at 9:00 AM (540 minutes) at Mission District (MD)
        (= (current-time) 540)
        (at md)
        
        ;; Initial state
        (= (meeting-duration margaret) 0)
        (= (total-cost) 0)
    )
    (:goal (and
        (met margaret)
    ))

    (:metric minimize (total-cost))
)