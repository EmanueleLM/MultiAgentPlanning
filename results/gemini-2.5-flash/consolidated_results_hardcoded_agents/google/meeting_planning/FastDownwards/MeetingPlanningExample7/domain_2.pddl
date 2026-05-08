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
        (window_421_495)     ; Time > 420 and Time <= 495 (John available, but 75 min meeting impossible)
        (post_495)           ; Time > 495 (John gone)
    )
    
    (:functions
        (total-time)
    )

    ; Travel from Richmond District (RD) to North Beach (NB) - 17 minutes
    ; Must occur before the John availability window starts.
    (:action travel_RD_NB
        :parameters ()
        :precondition (and 
            (at RichmondDistrict)
            (pre_375)
        )
        :effect (and
            (not (at RichmondDistrict))
            (at NorthBeach)
            (increase (total-time) 17) 
        )
    )

    ; Travel from North Beach (NB) to Richmond District (RD) - 18 minutes
    (:action travel_NB_RD
        :parameters ()
        :precondition (at NorthBeach)
        :effect (and
            (not (at NorthBeach))
            (at RichmondDistrict)
            (increase (total-time) 18) 
        )
    )

    ; Wait from arrival (T=17) until John is available (T=375). Wait duration: 358 minutes (375 - 17).
    (:action wait_to_start_window
        :parameters ()
        :precondition (and 
            (at NorthBeach)
            (pre_375)
        )
        :effect (and
            (not (pre_375))
            (window_375_420) ; Transition to T=375, where the safe meeting window opens
            (increase (total-time) 358) 
        )
    )

    ; Meet John for exactly 75 minutes. Must start during the safe window [375, 420].
    (:action meet_john_75min
        :parameters ()
        :precondition (and 
            (at NorthBeach)
            (window_375_420)
        )
        :effect (and
            (met_John)
            (not (window_375_420))
            ; Meeting ends at T >= 450, which is past T=420.
            (post_495) 
            (increase (total-time) 75) 
        )
    )

    ; Delay/Wait up to 45 minutes, transitioning out of the safe meeting window (T=375 -> T=420)
    (:action wait_and_close_safe_window
        :parameters ()
        :precondition (and 
            (at NorthBeach)
            (window_375_420)
            (not (met_John))
        )
        :effect (and
            (not (window_375_420))
            (window_421_495) ; Transition to T=420, making 75 min meeting impossible
            (increase (total-time) 45) 
        )
    )

    ; Wait until John leaves (T=495). This is a placeholder for waiting if the meeting was missed.
    ; This action is not required for optimization but ensures time consistency if meeting fails.
    (:action wait_until_john_leaves
        :parameters ()
        :precondition (and 
            (at NorthBeach)
            (window_421_495)
            (not (met_John))
        )
        :effect (and
            (not (window_421_495))
            (post_495) ; Transition to T=495
            (increase (total-time) 75) 
        )
    )
)