(define (problem meeting-planning-problem)
    (:domain meeting-planning)
    (:objects
        bayview golden-gate-park - location
    )
    (:init
        (at bayview)
        (= (current_time) 540) ; Traveler arrives at Bayview at 9:00 AM (9 * 60 minutes)
        (not (met_barbara))
    )
    (:goal
        (and
            (met_barbara)
        )
    )
    (:metric minimize (current_time)) ; Optimize for the earliest completion time of the meeting
)