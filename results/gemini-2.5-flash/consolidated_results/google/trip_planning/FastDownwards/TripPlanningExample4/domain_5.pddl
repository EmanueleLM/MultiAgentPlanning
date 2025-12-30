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
    
    ; Travel action occurs instantaneously at the start of a day 
    ; Requires that the minimum stay duration is met at the source city.
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
    (:action stay-seville-1
        :parameters ()
        :precondition (and (at seville) (current_day D1) (stayed_N_days seville C0))
        :effect (and (not (current_day D1)) (current_day D2) (not (stayed_N_days seville C0)) (stayed_N_days seville C1))
    )
    (:action stay-seville-2
        :parameters ()
        :precondition (and (at seville) (current_day D2) (stayed_N_days seville C1))
        :effect (and (not (current_day D2)) (current_day D3) (not (stayed_N_days seville C1)) (stayed_N_days seville C2))
    )
    (:action stay-seville-3
        :parameters ()
        :precondition (and (at seville) (current_day D3) (stayed_N_days seville C2))
        :effect (and (not (current_day D3)) (current_day D4) (not (stayed_N_days seville C2)) (stayed_N_days seville C3))
    )
    (:action stay-seville-4
        :parameters ()
        :precondition (and (at seville) (current_day D4) (stayed_N_days seville C3))
        :effect (and (not (current_day D4)) (current_day D5) (not (stayed_N_days seville C3)) (stayed_N_days seville C4))
    )
    (:action stay-seville-5
        :parameters ()
        :precondition (and (at seville) (current_day D5) (stayed_N_days seville C4))
        :effect (and (not (current_day D5)) (current_day D6) (not (stayed_N_days seville C4)) (stayed_N_days seville C5))
    )
    (:action stay-seville-6
        :parameters ()
        :precondition (and (at seville) (current_day D6) (stayed_N_days seville C5))
        :effect (and 
            (not (current_day D6)) (current_day D7) 
            (not (stayed_N_days seville C5)) (stayed_N_days seville C6)
            (required_days_met seville)
        )
    )
    
    ; --- Stay Actions Munich (4 days required: D7-D10) ---
    (:action stay-munich-1
        :parameters ()
        :precondition (and (at munich) (current_day D7) (stayed_N_days munich C0))
        :effect (and (not (current_day D7)) (current_day D8) (not (stayed_N_days munich C0)) (stayed_N_days munich C1))
    )
    (:action stay-munich-2
        :parameters ()
        :precondition (and (at munich) (current_day D8) (stayed_N_days munich C1))
        :effect (and (not (current_day D8)) (current_day D9) (not (stayed_N_days munich C1)) (stayed_N_days munich C2))
    )
    (:action stay-munich-3
        :parameters ()
        :precondition (and (at munich) (current_day D9) (stayed_N_days munich C2))
        :effect (and (not (current_day D9)) (current_day D10) (not (stayed_N_days munich C2)) (stayed_N_days munich C3))
    )
    (:action stay-munich-4
        :parameters ()
        :precondition (and (at munich) (current_day D10) (stayed_N_days munich C3))
        :effect (and 
            (not (current_day D10)) (current_day D11) 
            (not (stayed_N_days munich C3)) (stayed_N_days munich C4)
            (required_days_met munich)
        )
    )
    
    ; --- Stay Actions Tallinn (2 days required: D11-D12) ---
    (:action stay-tallinn-1
        :parameters ()
        :precondition (and (at tallinn) (current_day D11) (stayed_N_days tallinn C0))
        :effect (and 
            (not (current_day D11)) (current_day D12) 
            (not (stayed_N_days tallinn C0)) (stayed_N_days tallinn C1)
            (tallinn_day_11) ; Meeting constraint met
        )
    )
    (:action stay-tallinn-2
        :parameters ()
        :precondition (and (at tallinn) (current_day D12) (stayed_N_days tallinn C1))
        :effect (and 
            (not (current_day D12)) (current_day D13) 
            (not (stayed_N_days tallinn C1)) (stayed_N_days tallinn C2)
            (required_days_met tallinn)
            (tallinn_day_12) ; Meeting constraint met
        )
    )
)