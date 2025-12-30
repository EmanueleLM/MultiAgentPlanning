(define (problem MeetingPlanningExample9-P-STRIPS)
    (:domain meeting-planning-strips)
    (:objects
        Union_Square Nob_Hill - location
    )
    (:init
        (at Union_Square)
        (= (elapsed-time) 0) ; Elapsed time starts at T=540 absolute time
    )

    (:goal (and
        (meeting-done)
    ))

    (:metric minimize (elapsed-time))
)