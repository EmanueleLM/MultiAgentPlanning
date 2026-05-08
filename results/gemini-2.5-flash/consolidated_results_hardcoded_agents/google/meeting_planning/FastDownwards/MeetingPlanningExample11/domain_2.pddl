(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (ready_to_start_meeting)
        (met_carol)
    )
    
    (:action travel_nh_sd
        :parameters ()
        :precondition (and (at nob_hill))
        :effect (and 
            (not (at nob_hill))
            (at sunset_district)
            (increase (total-cost) 25)
        )
    )

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