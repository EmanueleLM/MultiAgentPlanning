(define (problem MeetingPlanningExample9-P-Temporal)
    (:domain meeting-planning)
    (:objects
        union-square nob-hill - location
    )
    (:init
        (at union-square)
        (= (current-time) 540) ; 9:00 AM start
        (= (total-meeting-time) 0)
    )

    (:goal (and
        (>= (total-meeting-time) 75) ; Must meet Mary for at least 75 minutes
    ))

    ; Metric: Minimize the absolute current time when the goal is achieved.
    (:metric minimize (current-time))
)