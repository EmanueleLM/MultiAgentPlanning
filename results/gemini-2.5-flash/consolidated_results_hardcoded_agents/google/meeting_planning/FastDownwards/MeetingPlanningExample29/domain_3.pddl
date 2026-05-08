(define (domain MeetingPlanningExample29)
    (:requirements :strips :typing :negative-preconditions)
    (:types location)
    (:predicates
        (at ?l - location)
        (met-for-min-75) ; 75 minutes minimum duration achieved
        (t-540-start) ; 9:00 AM Traveler starts
        (t-555-arrived-ha) ; 9:15 AM Traveler arrives at HA (540 + 15)
        (t-1170-start-meet-window) ; 7:30 PM Nancy available start
        (t-1245-met-minimum) ; 8:45 PM Minimum 75 min met (1170 + 75)
        (t-1305-end-meet-window) ; 9:45 PM Nancy leaves, maximum time reached
    )

    ;; 1. TRAVEL SD -> HA (Duration 15 min, 540 -> 555)
    (:action travel_sd_ha
        :parameters ()
        :precondition (and (at sd) (t-540-start))
        :effect (and
            (not (at sd))
            (at ha)
            (not (t-540-start))
            (t-555-arrived-ha)
        )
    )

    ;; 2. WAIT at HA (Duration 615 min, 555 -> 1170)
    (:action wait_for_nancy_window
        :parameters ()
        :precondition (and (at ha) (t-555-arrived-ha))
        :effect (and
            (not (t-555-arrived-ha))
            (t-1170-start-meet-window)
        )
    )

    ;; 3. MEET Minimum 75 min (Duration 75 min, 1170 -> 1245)
    (:action meet_nancy_minimum_75_minutes
        :parameters ()
        :precondition (and
            (at ha)
            (t-1170-start-meet-window)
        )
        :effect (and
            (not (t-1170-start-meet-window))
            (t-1245-met-minimum)
            (met-for-min-75)
        )
    )
    
    ;; 4. CONTINUE MEETING to Maximize (Duration 60 min, 1245 -> 1305)
    (:action meet_nancy_continue_to_max
        :parameters ()
        :precondition (t-1245-met-minimum)
        :effect (and
            (not (t-1245-met-minimum))
            (t-1305-end-meet-window)
        )
    )
)