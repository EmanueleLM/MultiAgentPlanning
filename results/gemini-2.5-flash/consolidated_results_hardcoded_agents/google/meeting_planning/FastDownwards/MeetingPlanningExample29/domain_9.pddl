(define (domain MeetingPlanningExample29)
    (:requirements :durative-actions :fluents :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
    )
    (:functions
        (total-meeting-time)
        (current-time)
    )

    ;; A. Travel from Sunset (540) to Haight (555). Duration 15 min.
    (:durative-action travel_sunset_haight
        :parameters ()
        :duration (= ?duration 15)
        :condition (and
            (at start (at sunset))
            (at start (= (current-time) 540))
        )
        :effect (and
            (at end (not (at sunset)))
            (at end (at haight))
            (at end (assign (current-time) 555))
        )
    )

    ;; B. Wait at Haight (555 -> 1170). Duration 615 min.
    (:durative-action wait_at_haight
        :parameters ()
        :duration (= ?duration 615)
        :condition (and
            (at start (at haight))
            (at start (= (current-time) 555))
        )
        :effect (and
            (at end (assign (current-time) 1170))
        )
    )

    ;; C. Meeting Nancy (1170 start). Duration must be 75 <= D <= 135.
    (:durative-action meet_nancy
        :parameters ()
        :duration (?duration)
        :condition (and
            (at start (at haight))
            (at start (= (current-time) 1170))
            
            ; Maximum availability window: 1305 - 1170 = 135 minutes
            (over all (<= ?duration 135)) 
            ; Minimum required meeting duration: 75 minutes
            (over all (>= ?duration 75)) 
        )
        :effect (and
            (at end (increase (total-meeting-time) ?duration))
            (at end (increase (current-time) ?duration))
        )
    )
)