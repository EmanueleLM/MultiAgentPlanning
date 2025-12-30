(define (problem MeetingPlanningExample9-P-Temporal)
    (:domain meeting-planning-temporal)
    (:objects
        union-square nob-hill - location
    )
    (:init
        (at union-square) ; Start location
        (= (current-time) 540) ; Start time (9:00 AM)
    )

    (:goal (and
        (meeting-completed) ; Ensure meeting duration of >= 75 minutes is completed.
    ))

    (:metric minimize (current-time)) ; Minimize the total absolute time until the goal is achieved.
)