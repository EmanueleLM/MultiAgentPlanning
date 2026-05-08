(define (problem MeetingPlanningExample9-P-Temporal)
    (:domain meeting-planning-temporal)
    (:objects
        union-square nob-hill - location
    )
    (:init
        (at union-square) ; Start location
        (= (current-time) 540) ; Start time: 9:00 AM (540 minutes from midnight)
    )

    (:goal (and
        (meeting-completed) ; Ensure meeting duration of >= 75 minutes is completed within Mary's window
    ))

    (:metric minimize (current-time)) ; Minimize the absolute end time of the meeting.
)