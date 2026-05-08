(define (problem meeting-planning-problem)
    (:domain meeting-planning)
    (:objects
        bayview golden_gate_park - location
    )
    (:init
        (at bayview) ; Traveler starts at Bayview
        (at_barbara golden_gate_park) ; Barbara is at Golden Gate Park
        (= (current_time) 540) ; Traveler arrives at Bayview at 9:00 AM (9 * 60 minutes)
        (= (total-cost) 0) ; Initial total cost
        (not (met_barbara)) ; Barbara has not been met yet
    )
    (:goal
        (and
            (met_barbara)
        )
    )
    (:metric minimize (total-cost))
)