(define (domain trip_planning)
    (:requirements :strips :typing)
    (:types
        city day level
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (count ?c - city ?n - level)
        (next_count ?n1 ?n2 - level)
        (can_fly ?c1 ?c2 - city)
        (visited ?c - city ?d - day)
    )

    ;; The stay action increments the count for the city and records a visit for that day.
    (:action stay
        :parameters (?c - city ?d - day ?dn - day ?nc - level ?nn - level)
        :precondition (and 
            (at ?c) 
            (current_day ?d) 
            (next_day ?d ?dn) 
            (count ?c ?nc) 
            (next_count ?nc ?nn)
        )
        :effect (and 
            (not (current_day ?d)) 
            (current_day ?dn) 
            (not (count ?c ?nc)) 
            (count ?c ?nn) 
            (visited ?c ?d)
        )
    )

    ;; The fly action increments the count for both cities and records a visit for both for that day.
    ;; This allows the 7-day trip to satisfy the required counts through travel-day overlap.
    (:action fly
        :parameters (?f - city ?t - city ?d - day ?dn - day ?nfc - level ?nfn - level ?ntc - level ?ntn - level)
        :precondition (and 
            (at ?f) 
            (current_day ?d) 
            (next_day ?d ?dn) 
            (can_fly ?f ?t) 
            (count ?f ?nfc) 
            (next_count ?nfc ?nfn) 
            (count ?t ?ntc) 
            (next_count ?ntc ?ntn)
        )
        :effect (and 
            (not (at ?f)) 
            (at ?t) 
            (not (current_day ?d)) 
            (current_day ?dn) 
            (not (count ?f ?nfc)) 
            (count ?f ?nfn) 
            (not (count ?t ?ntc)) 
            (count ?t ?ntn) 
            (visited ?f ?d) 
            (visited ?t ?d)
        )
    )
)