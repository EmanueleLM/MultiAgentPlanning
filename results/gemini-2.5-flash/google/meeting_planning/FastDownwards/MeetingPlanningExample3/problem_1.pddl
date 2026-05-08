(define (problem meeting-planning-problem)
    (:domain meeting-planning)
    (:objects
        bayview golden-gate-park - location
    )
    (:init
        (at bayview)
        (= (current_time) 540) ; 9:00 AM
        (= (total_travel_time) 0)
        (= (total-cost) 0)
        (not (met_barbara))
    )
    (:goal
        (and
            (met_barbara)
        )
    )
    (:metric minimize (total-cost))
)