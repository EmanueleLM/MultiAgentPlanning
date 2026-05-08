(define (domain trip-planning-9)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city - object
        day - object
    )

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        (is-day ?d - day)
        (next-day ?d1 - day ?d2 - day)
        
        ; Day classification for constraints
        (pre-workshop-day ?d - day)         
        (workshop-start-day ?d - day)       
        (workshop-mandatory-stay-day ?d - day) 
        (final-day ?d - day)                
    )

    (:functions
        (total-cost) 
    )

    ; Travel action (happens within a day)
    (:action travel
        :parameters (?from - city ?to - city)
        :precondition (and 
            (at ?from)
            (connected ?from ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (increase (total-cost) 1) 
        )
    )

    ; Daily Progression Actions 
    
    ; 1. Stay on a pre-workshop day (D1, D2, D3).
    (:action progress-day-pre-workshop
        :parameters (?d_from - day ?d_to - day ?c - city)
        :precondition (and
            (is-day ?d_from)
            (next-day ?d_from ?d_to)
            (pre-workshop-day ?d_from)
            (at ?c) ; Can stay in any city C
        )
        :effect (and
            (not (is-day ?d_from))
            (is-day ?d_to)
        )
    )

    ; 2. Stay on D4. Must be in Stuttgart to proceed to D5 (Workshop start).
    (:action progress-day-workshop-start
        :parameters (?d_from - day ?d_to - day ?s - city)
        :precondition (and
            (is-day ?d_from)
            (next-day ?d_from ?d_to)
            (workshop-start-day ?d_from) ; D4
            (at ?s)
            (= ?s stuttgart) 
        )
        :effect (and
            (not (is-day ?d_from))
            (is-day ?d_to)
        )
    )

    ; 3. Stay during workshop period (D5, D6, D7, D8, D9). Must stay in Stuttgart.
    (:action progress-day-workshop-mandatory
        :parameters (?d_from - day ?d_to - day ?s - city)
        :precondition (and
            (is-day ?d_from)
            (next-day ?d_from ?d_to)
            (workshop-mandatory-stay-day ?d_from) 
            (at ?s)
            (= ?s stuttgart) 
        )
        :effect (and
            (not (is-day ?d_from))
            (is-day ?d_to)
        )
    )

    ; 4. Final day check (D10). Ensures the goal checks on D10 are met.
    (:action finish-trip-d10
        :parameters (?d - day ?s - city)
        :precondition (and
            (is-day ?d)
            (final-day ?d) ; D10
            (at ?s)
            (= ?s stuttgart)
        )
        :effect (and
            ; No state change needed for progression, just meeting goal conditions
        )
    )
)