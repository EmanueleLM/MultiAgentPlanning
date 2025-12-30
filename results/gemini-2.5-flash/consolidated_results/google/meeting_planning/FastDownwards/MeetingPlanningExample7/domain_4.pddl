(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location - object
    )
    
    (:predicates
        (at ?l - location) ; Visitor is at location L
        (met_John)        ; Goal achieved: met John for the required duration (75 minutes)
        
        ; Symbolic time windows based on constraints:
        (pre_375)            ; Time < 375 (Before 3:15 PM)
        (window_375_420)     ; Time >= 375 and Time <= 420 (Safe meeting start window for 75 min meeting)
        (window_421_495)     ; Time > 420 and Time <= 495 (John available, but 75 min meeting impossible due to start time constraint)
        (post_495)           ; Time > 495 (John gone)
    )
    
    (:functions
        (total-cost) ; Using total-cost for metric minimization
    )

    ; Travel from Richmond District (RD) to North Beach (NB) - 17 minutes
    (:action travel_RD_NB
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
    (:action travel_NB_RD
        :parameters ()
        :precondition (at north-beach)
        :effect (and
            (not (at north-beach))
            (at richmond-district)
            (increase (total-cost) 18) 
        )
    )

    ; Wait from arrival (T=17) until John is available (T=375). Wait duration: 358 minutes (375 - 17).
    (:action wait_to_start_window
        :parameters ()
        :precondition (and 
            (at north-beach)
            (pre_375)
        )
        :effect (and
            (not (pre_375))
            (window_375_420) ; Transition to T=375, where the safe meeting window opens
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
            (met_John)
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
            (not (met_John))
        )
        :effect (and
            (not (window_375_420))
            (window_421_495) ; Transition to time > 420 (too late to start 75 min meeting)
            (increase (total-cost) 45) 
        )
    )

    ; Wait until John leaves (T=495). This action takes 75 minutes if started at T=420.
    (:action wait_until_john_leaves
        :parameters ()
        :precondition (and 
            (at north-beach)
            (window_421_495)
            (not (met_John))
        )
        :effect (and
            (not (window_421_495))
            (post_495) ; Transition to T=495
            (increase (total-cost) 75) 
        )
    )
)