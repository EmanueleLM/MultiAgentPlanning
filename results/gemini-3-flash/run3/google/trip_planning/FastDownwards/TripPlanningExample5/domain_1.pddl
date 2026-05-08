(define (domain trip_planning_example_5)
    (:requirements :strips :typing)
    (:types city day count_val)
    
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (city_count ?c - city ?n - count_val)
        (next_count ?n1 ?n2 - count_val)
        (connected ?c1 ?c2 - city)
        (stayed ?c - city ?d - day)
    )

    ;; A stay action spends one full day in a single city.
    ;; The day counts as one visit for that city.
    (:action stay
        :parameters (?c - city ?d - day ?dn - day ?n - count_val ?nn - count_val)
        :precondition (and 
            (at ?c) 
            (current_day ?d) 
            (next_day ?d ?dn)
            (city_count ?c ?n) 
            (next_count ?n ?nn)
        )
        :effect (and 
            (not (current_day ?d)) 
            (current_day ?dn)
            (not (city_count ?c ?n)) 
            (city_count ?c ?nn)
            (stayed ?c ?d)
        )
    )

    ;; A fly action spends the day commuting between two cities.
    ;; To make the 18 required stay-days fit into 16 total days, 
    ;; the flight day must count as a visit for BOTH the origin and destination cities.
    (:action fly
        :parameters (?from - city ?to - city ?d - day ?dn - day ?nf - count_val ?nfn - count_val ?nt - count_val ?ntn - count_val)
        :precondition (and 
            (at ?from) 
            (current_day ?d) 
            (next_day ?d ?dn) 
            (connected ?from ?to)
            (city_count ?from ?nf) 
            (next_count ?nf ?nfn)
            (city_count ?to ?nt) 
            (next_count ?nt ?ntn)
        )
        :effect (and 
            (not (at ?from)) 
            (at ?to) 
            (not (current_day ?d)) 
            (current_day ?dn)
            (not (city_count ?from ?nf)) 
            (city_count ?from ?nfn)
            (not (city_count ?to ?nt)) 
            (city_count ?to ?ntn)
            (stayed ?from ?d) 
            (stayed ?to ?d)
        )
    )
)