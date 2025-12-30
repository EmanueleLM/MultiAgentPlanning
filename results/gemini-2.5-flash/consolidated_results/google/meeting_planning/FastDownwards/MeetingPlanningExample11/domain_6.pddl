(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (p_arrived_sd)
        (p_start_window_open)
        (p_meeting_complete)
    )
    (:functions
        (total-cost)
        (meeting-duration)
    )

    ;; 1. Travel from Nob Hill (T=0) to Sunset District (Duration: 25 min)
    (:action travel_nh_sd
        :parameters ()
        :precondition (and 
            (at nob_hill)
            (not (p_arrived_sd))
        )
        :effect (and 
            (not (at nob_hill))
            (at sunset_district)
            (p_arrived_sd)
            (increase (total-cost) 25)
        )
    )

    ;; 2. Wait until 2:00 PM (T=300). Duration: 275 min (300 - 25).
    (:action wait_for_window_start
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (p_arrived_sd)
            (not (p_start_window_open))
        )
        :effect (and 
            (p_start_window_open)
            (increase (total-cost) 275) 
        )
    )

    ;; 3a. Meet Carol for the required minimum duration: 75 minutes. Starts at T=300, ends at T=375.
    (:action meet_carol_minimum
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (p_start_window_open)
            (not (p_meeting_complete))
        )
        :effect (and 
            (p_meeting_complete)
            (increase (total-cost) 75)
            (increase (meeting-duration) 75)
        )
    )

    ;; 3b. Extend meeting maximally up to 8:30 PM (T=690). Remaining duration: 690 - 375 = 315 minutes.
    (:action meet_carol_extension_max
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (p_meeting_complete)
        )
        :effect (and 
            (increase (total-cost) 315)
            (increase (meeting-duration) 315)
        )
    )
    
    ;; 4. Travel back to Nob Hill (Duration: 27 min).
    (:action travel_sd_nh
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (p_meeting_complete)
        )
        :effect (and 
            (not (at sunset_district))
            (at nob_hill)
            (increase (total-cost) 27)
        )
    )