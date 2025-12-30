(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (p_arrived_sd)
        (p_start_window_open) ; Time >= 300 minutes (2:00 PM)
        (p_meeting_done)
        (p_returned_home)
    )
    (:functions
        (total-cost) ; Represents time elapsed in minutes since 9:00 AM
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
    (:action wait_for_window
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

    ;; 3. Meet Carol for the required minimum duration: 75 minutes (T=300 to T=375).
    (:action meet_carol_mandatory
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (p_start_window_open)
            (not (p_meeting_done))
        )
        :effect (and 
            (p_meeting_done)
            (increase (total-cost) 75)
        )
    )
    
    ;; 4. Travel back to Nob Hill (Duration: 27 min). Included for completeness, but not required by goal.
    (:action travel_sd_nh
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (p_meeting_done)
            (not (p_returned_home))
        )
        :effect (and 
            (not (at sunset_district))
            (at nob_hill)
            (p_returned_home)
            (increase (total-cost) 27)
        )
    )
)