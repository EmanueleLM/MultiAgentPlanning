(define (problem MeetingPlanningExample9-P-STRIPS)
    (:domain meeting-planning-strips)
    (:objects
        union-square nob-hill - location
    )
    (:init
        (at union-square) ; Start location (T_abs=540)
        (= (total-cost) 0) ; Time elapsed since 9:00 AM
    )

    (:goal (and
        (meeting-completed) ; Ensure meeting duration of >= 75 minutes is completed.
    ))

    (:metric minimize (total-cost)) ; Minimize the total elapsed time until the goal is achieved.
)