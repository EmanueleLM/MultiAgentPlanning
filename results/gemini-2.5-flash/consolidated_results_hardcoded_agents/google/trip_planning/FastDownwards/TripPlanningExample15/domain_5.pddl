(define (domain trip-planning-v15)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city - object
        day - object
        number - object
    )

    (:constants
        berlin porto krakow - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - number
    )

    (:predicates
        (current-day ?d - day)
        (at ?c - city)
        (next-day ?d1 - day ?d2 - day)
        (connection ?c1 - city ?c2 - city)
        
        (stay-count ?c - city ?n - number)
        (is-successor ?n1 - number ?n2 - number)
    )

    (:functions
        (total-cost)
    )

    ; 1. Stay action (D1 to D9 transitions): Regular stay, moves day forward, increments count.
    (:action stay
        :parameters (?c - city ?d_current - day ?d_next - day ?n_current - number ?n_next - number)
        :precondition (and
            (at ?c)
            (current-day ?d_current)
            (next-day ?d_current ?d_next)
            ; Restricts to days before D10
            (not (current-day d10)) 
            (not (current-day d11)) 
            (stay-count ?c ?n_current)
            (is-successor ?n_current ?n_next)
        )
        :effect (and
            (not (current-day ?d_current))
            (current-day ?d_next)
            (not (stay-count ?c ?n_current))
            (stay-count ?c ?n_next)
            (increase (total-cost) 1)
        )
    )
    
    ; 2. Travel action (D1 to D9 transitions): Changes location, moves day forward. Restricted to D1-D9 transitions.
    (:action travel
        :parameters (?c_from - city ?c_to - city ?d_current - day ?d_next - day)
        :precondition (and
            (at ?c_from)
            (connection ?c_from ?c_to)
            (current-day ?d_current)
            (next-day ?d_current ?d_next)
            ; Restricts to days before D10
            (not (current-day d10)) 
            (not (current-day d11))
        )
        :effect (and
            (not (at ?c_from))
            (at ?c_to)
            (not (current-day ?d_current))
            (current-day ?d_next)
            (increase (total-cost) 1)
        )
    )

    ; 3. D10 Stay Action: Must be Porto (hard constraint). Moves day D10 -> D11.
    (:action stay-d10-porto
        :parameters (?n_current - number ?n_next - number)
        :precondition (and
            (at porto)
            (current-day d10)
            (next-day d10 d11)
            (stay-count porto ?n_current)
            (is-successor ?n_current ?n_next)
        )
        :effect (and
            (not (current-day d10))
            (current-day d11)
            (not (stay-count porto ?n_current))
            (stay-count porto ?n_next)
            (increase (total-cost) 1)
        )
    )
    
    ; 4. Final Day D11 Stay Action: Must be Porto (hard constraint), completes the 11-day trip duration.
    (:action stay-d11-porto
        :parameters (?n_current - number ?n_next - number)
        :precondition (and
            (at porto)
            (current-day d11)
            (stay-count porto ?n_current)
            (is-successor ?n_current ?n_next)
        )
        :effect (and
            ; Day remains d11
            (not (stay-count porto ?n_current))
            (stay-count porto ?n_next)
            (increase (total-cost) 1)
        )
    )
)