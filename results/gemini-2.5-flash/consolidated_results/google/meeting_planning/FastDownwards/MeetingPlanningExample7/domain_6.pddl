(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location - object
    )
    
    (:predicates
        (at ?l - location) ; Visitor is at location L
        (met_john)        ; Goal achieved: met John for the required duration (75 minutes)
        
        ; Symbolic time windows based on constraints (T relative to 9:00 AM):
        (pre_375)            ; Time < 375 (Before 3:15 PM)
        (window_375_420)     ; Time >= 375 and Time <= 420 (Safe meeting start window: latest start is 4:00 PM / T=420)
        (window_421_495)     ; Time > 420 and Time <= 495 (John available, but 75 min meeting start impossible)
        (post_495)           ; Time > 495 (John gone, 5:15 PM)
    )
    
    (:functions
        (total-cost)
    )

    ; Travel from Richmond District (RD) to North Beach (NB) - 17 minutes
    (:action travel_rd_nb
        :parameters ()
        :precondition (and 
            (at richmond-district)
            (pre_375)
        )
        :effect (and
            (not (at richmond-district))
            (at north-beach)
            (increase (total-cost) 17) 
        )
    )

    ; Travel from North Beach (NB) to Richmond District (RD) - 18 minutes
    (:action travel_nb_rd
        :parameters ()
        :precondition (at north-beach)
        :effect (and
            (not (at north-beach))
            (at richmond-district)
            (increase (total-cost) 18) 
        )
    )

    ; Wait necessary to reach T=375 (3:15 PM). If traveled immediately (T=17), wait duration = 358 minutes.
    (:action wait_to_start_window
        :parameters ()
        :precondition (and 
            (at north-beach)
            (pre_375)
        )
        :effect (and
            (not (pre_375))
            (window_375_420) ; Transition to T=375
            (increase (total-cost) 358) 
        )
    )

    ; Meet John for exactly 75 minutes. Must start during the safe window [375, 420].
    (:action meet_john_75min
        :parameters ()
        :precondition (and 
            (at north-beach)
            (window_375_420)
        )
        :effect (and
            (met_john)
            (not (window_375_420))
            (increase (total-cost) 75) 
        )
    )

    ; Delay/Wait 45 minutes, symbolically consuming the safe window (T=375 to T=420)
    (:action wait_and_close_safe_window
        :parameters ()
        :precondition (and 
            (at north-beach)
            (window_375_420)
            (not (met_john))
        )
        :effect (and
            (not (window_375_420))
            (window_421_495) ; Transition to time > 420
            (increase (total-cost) 45) 
        )
    )

    ; Wait until John leaves (T=495). This action takes 75 minutes if started at T=420.
    (:action wait_until_john_leaves
        :parameters ()
        :precondition (and 
            (at north-beach)
            (window_421_495)
            (not (met_john))
        )
        :effect (and
            (not (window_421_495))
            (post_495) ; Transition to T=495
            (increase (total-cost) 75) 
        )
    )
)