(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (ready_to_start_meeting) ; State reached when T >= 300 (2:00 PM)
        (met_carol)              ; Goal predicate
    )
    
    ;; Travel from Nob Hill (NH) to Sunset District (SD). Cost: 25 min.
    (:action travel_nh_sd
        :parameters ()
        :precondition (and (at nob_hill))
        :effect (and 
            (not (at nob_hill))
            (at sunset_district)
            (increase (total-cost) 25)
        )
    )

    ;; Wait period necessary to reach minimum start time T=300 (2:00 PM). 
    ;; Cost is calculated based on optimal path: 300 (start time) - 25 (travel time) = 275 min.
    (:action wait_to_start_window
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (not (ready_to_start_meeting))
        )
        :effect (and 
            (ready_to_start_meeting)
            (increase (total-cost) 275)
        )
    )
    
    ;; Meeting Carol. Fixed duration of 75 minutes (minimum required). 
    ;; Requires T >= 300 (ready_to_start_meeting) and presence at Sunset District.
    (:action meet_carol
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (ready_to_start_meeting)
            (not (met_carol))
        )
        :effect (and 
            (met_carol)
            (increase (total-cost) 75)
        )
    )
    
    ;; Optional travel back SD -> NH (27 min)
    (:action travel_sd_nh
        :parameters ()
        :precondition (and 
            (at sunset_district)
            (met_carol)
        )
        :effect (and 
            (not (at sunset_district))
            (at nob_hill)
            (increase (total-cost) 27)
        )
    )
)