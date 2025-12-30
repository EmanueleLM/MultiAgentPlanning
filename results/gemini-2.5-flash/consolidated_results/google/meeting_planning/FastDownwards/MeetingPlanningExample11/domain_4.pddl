(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (p_arrived_sd)
        (p_start_window_open) ; Time >= 300 minutes (2:00 PM)
        (p_meeting_complete) ; Minimum 75 minutes requirement met
    )
    (:functions
        (total-cost) ; Overall time elapsed in minutes since 9:00 AM
        (meeting-duration)
    )

    ;; 1. Travel from Nob Hill (T=0) to Sunset District (T=25). Duration: 25 min.
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

    ;; 2. Wait until 2:00 PM (T=300). Duration: 300 - 25 = 275 min.
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

    ;; 3a. Meet Carol for the required minimum duration: 75 minutes (T=300 to T=375).
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

    ;; 3b. Extend meeting maximally up to 8:30 PM (T=510). 
    ;; Remaining duration: 510 - 375 = 135 minutes. This action maximizes meeting duration.
    (:action meet_carol_extension_max
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (p_meeting_complete)
        )
        :effect (and 
            (increase (total-cost) 135)
            (increase (meeting-duration) 135)
        )
    )
    
    ;; 4. Travel back to Nob Hill (Duration: 27 min). Optional action.
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