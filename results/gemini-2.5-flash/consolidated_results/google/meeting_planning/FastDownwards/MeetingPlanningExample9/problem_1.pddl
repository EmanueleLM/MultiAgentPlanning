(define (problem MeetingPlanningExample9-P)
    (:domain meeting-planning-temporal)
    (:objects
        Union_Square Nob_Hill - location
    )
    (:init
        ; Initial location and time (9:00 AM = 540 min)
        (at Union_Square)
        (= (current_time) 540)
        (= (mary_meeting_duration) 0)

        ; Travel Times
        (= (travel_time Union_Square Nob_Hill) 9)
        (= (travel_time Nob_Hill Union_Square) 7)

        ; Availability Constants
        (= (mary_availability_start) 720) ; 12:00 PM
        (= (mary_availability_end) 975)   ; 4:15 PM
        (= (required_meeting_duration) 75)
    )

    (:goal (and
        ; Ensure total meeting duration meets the minimum requirement
        (>= (mary_meeting_duration) (required_meeting_duration))
    ))

    (:metric minimize (current_time))
)