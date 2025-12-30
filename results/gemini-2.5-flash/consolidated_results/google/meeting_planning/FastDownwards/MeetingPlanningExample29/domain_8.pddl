(define (domain MeetingPlanningExample29)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (met-for-min-75) ; 75 minutes minimum duration achieved
        (t-540) ; 9:00 AM Traveler starts
        (t-555) ; 9:15 AM Arrived Haight
        (t-1170) ; 7:30 PM Nancy available start
        (t-1245) ; 8:45 PM Minimum 75 min met
        (t-1305) ; 9:45 PM Nancy leaves
    )
    (:functions
        (total-meeting-time)
    )

    ;; 1. TRAVEL sunset -> haight (Duration 15 min, 540 -> 555)
    (:action travel_sunset_haight
        :parameters ()
        :precondition (and (at sunset) (t-540))
        :effect (and
            (not (at sunset))
            (at haight)
            (not (t-540))
            (t-555)
        )
    )

    ;; 2. WAIT at haight (Duration 615 min, 555 -> 1170)
    (:action wait_for_nancy_window
        :parameters ()
        :precondition (and (at haight) (t-555))
        :effect (and
            (not (t-555))
            (t-1170)
        )
    )

    ;; 3. MEET Minimum 75 min (Duration 75 min, 1170 -> 1245)
    (:action meet_nancy_minimum_75_minutes
        :parameters ()
        :precondition (and
            (at haight)
            (t-1170)
        )
        :effect (and
            (not (t-1170))
            (t-1245)
            (met-for-min-75)
            (increase (total-meeting-time) 75)
        )
    )
    
    ;; 4. CONTINUE MEETING to Maximize (Duration 60 min, 1245 -> 1305)
    (:action meet_nancy_continue_to_max
        :parameters ()
        :precondition (and
            (at haight)
            (t-1245)
        )
        :effect (and
            (not (t-1245))
            (t-1305)
            (increase (total-meeting-time) 60)
        )
    )
)