(define (domain MeetingPlanningExample29)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (met-for-min-75) ; 75 minutes minimum duration achieved
        (t-540-start) ; 9:00 AM Traveler starts
        (t-555-arrived-ha) ; 9:15 AM Traveler arrives at Haight-Ashbury
        (t-1170-start-meet-window) ; 7:30 PM Nancy available start
        (t-1245-met-minimum) ; 8:45 PM Minimum 75 min met
        (t-1305-end-meet-window) ; 9:45 PM Nancy leaves, maximum time reached
    )
    (:functions
        (total-meeting-time)
    )

    ;; 1. TRAVEL Sunset -> Haight (Duration 15 min, 540 -> 555)
    (:action travel_sunset_haight
        :parameters ()
        :precondition (and (at sunset) (t-540-start))
        :effect (and
            (not (at sunset))
            (at haight)
            (not (t-540-start))
            (t-555-arrived-ha)
        )
    )

    ;; 2. WAIT at Haight (Duration 615 min, 555 -> 1170)
    (:action wait_for_nancy_window
        :parameters ()
        :precondition (and (at haight) (t-555-arrived-ha))
        :effect (and
            (not (t-555-arrived-ha))
            (t-1170-start-meet-window)
        )
    )

    ;; 3. MEET Minimum 75 min (Duration 75 min, 1170 -> 1245)
    (:action meet_nancy_minimum_75_minutes
        :parameters ()
        :precondition (and
            (at haight)
            (t-1170-start-meet-window)
        )
        :effect (and
            (not (t-1170-start-meet-window))
            (t-1245-met-minimum)
            (met-for-min-75)
            (increase (total-meeting-time) 75)
        )
    )
    
    ;; 4. CONTINUE MEETING to Maximize (Duration 60 min, 1245 -> 1305)
    (:action meet_nancy_continue_to_max
        :parameters ()
        :precondition (t-1245-met-minimum)
        :effect (and
            (not (t-1245-met-minimum))
            (t-1305-end-meet-window)
            (increase (total-meeting-time) 60)
        )
    )