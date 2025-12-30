(define (domain TripPlanning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day_counter
        count
    )

    (:predicates
        (at ?c - city)
        (connected ?c1 ?c2 - city)
        (current_day ?d - day_counter)
        (stayed_N_days ?c - city ?n - count)
        (required_days_met ?c - city)
        
        (tallinn_day_11)
        (tallinn_day_12)
    )
    
    ; Travel action occurs instantaneously at the start of a day (e.g., D7 or D11) 
    ; provided the stay requirement at the source city is met.
    (:action travel
        :parameters (?from ?to - city ?d - day_counter)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (current_day ?d)
            (required_days_met ?from)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
        )
    )

    ; --- Stay Actions Seville (6 days required: D1-D6) ---
    (:action stay_S1
        :parameters ()
        :precondition (and (at Seville) (current_day D1) (stayed_N_days Seville C0))
        :effect (and (not (current_day D1)) (current_day D2) (not (stayed_N_days Seville C0)) (stayed_N_days Seville C1))
    )
    (:action stay_S2
        :parameters ()
        :precondition (and (at Seville) (current_day D2) (stayed_N_days Seville C1))
        :effect (and (not (current_day D2)) (current_day D3) (not (stayed_N_days Seville C1)) (stayed_N_days Seville C2))
    )
    (:action stay_S3
        :parameters ()
        :precondition (and (at Seville) (current_day D3) (stayed_N_days Seville C2))
        :effect (and (not (current_day D3)) (current_day D4) (not (stayed_N_days Seville C2)) (stayed_N_days Seville C3))
    )
    (:action stay_S4
        :parameters ()
        :precondition (and (at Seville) (current_day D4) (stayed_N_days Seville C3))
        :effect (and (not (current_day D4)) (current_day D5) (not (stayed_N_days Seville C3)) (stayed_N_days Seville C4))
    )
    (:action stay_S5
        :parameters ()
        :precondition (and (at Seville) (current_day D5) (stayed_N_days Seville C4))
        :effect (and (not (current_day D5)) (current_day D6) (not (stayed_N_days Seville C4)) (stayed_N_days Seville C5))
    )
    (:action stay_S6
        :parameters ()
        :precondition (and (at Seville) (current_day D6) (stayed_N_days Seville C5))
        :effect (and 
            (not (current_day D6)) (current_day D7) 
            (not (stayed_N_days Seville C5)) (stayed_N_days Seville C6)
            (required_days_met Seville)
        )
    )
    
    ; --- Stay Actions Munich (4 days required: D7-D10) ---
    (:action stay_M1
        :parameters ()
        :precondition (and (at Munich) (current_day D7) (stayed_N_days Munich C0))
        :effect (and (not (current_day D7)) (current_day D8) (not (stayed_N_days Munich C0)) (stayed_N_days Munich C1))
    )
    (:action stay_M2
        :parameters ()
        :precondition (and (at Munich) (current_day D8) (stayed_N_days Munich C1))
        :effect (and (not (current_day D8)) (current_day D9) (not (stayed_N_days Munich C1)) (stayed_N_days Munich C2))
    )
    (:action stay_M3
        :parameters ()
        :precondition (and (at Munich) (current_day D9) (stayed_N_days Munich C2))
        :effect (and (not (current_day D9)) (current_day D10) (not (stayed_N_days Munich C2)) (stayed_N_days Munich C3))
    )
    (:action stay_M4
        :parameters ()
        :precondition (and (at Munich) (current_day D10) (stayed_N_days Munich C3))
        :effect (and 
            (not (current_day D10)) (current_day D11) 
            (not (stayed_N_days Munich C3)) (stayed_N_days Munich C4)
            (required_days_met Munich)
        )
    )
    
    ; --- Stay Actions Tallinn (2 days required: D11-D12) ---
    (:action stay_T1
        :parameters ()
        :precondition (and (at Tallinn) (current_day D11) (stayed_N_days Tallinn C0))
        :effect (and 
            (not (current_day D11)) (current_day D12) 
            (not (stayed_N_days Tallinn C0)) (stayed_N_days Tallinn C1)
            (tallinn_day_11)
        )
    )
    (:action stay_T2
        :parameters ()
        :precondition (and (at Tallinn) (current_day D12) (stayed_N_days Tallinn C1))
        :effect (and 
            (not (current_day D12)) (current_day D13) 
            (not (stayed_N_days Tallinn C1)) (stayed_N_days Tallinn C2)
            (required_days_met Tallinn)
            (tallinn_day_12)
        )
    )
)