(define (domain TripPlanning14)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        day
    )

    (:constants
        lyon frankfurt krakow - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    )

    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (day_after ?d1 ?d2 - day)
        (connected ?c1 ?c2 - city)
        (is_fixed_k_day ?d - day)
    )

    (:functions
        (total-cost)
        (l-stays)
        (f-stays)
        (k-stays)
    )

    ; --- Stay Actions ---

    (:action stay_L
        :parameters (?d1 ?d2 - day)
        :precondition (and
            (at lyon)
            (current_day ?d1)
            (day_after ?d1 ?d2)
            (not (is_fixed_k_day ?d1))
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
            (increase (l-stays) 1)
        )
    )

    (:action stay_F
        :parameters (?d1 ?d2 - day)
        :precondition (and
            (at frankfurt)
            (current_day ?d1)
            (day_after ?d1 ?d2)
            (not (is_fixed_k_day ?d1))
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
            (increase (f-stays) 1)
        )
    )

    (:action stay_K
        :parameters (?d1 ?d2 - day)
        :precondition (and
            (at krakow)
            (current_day ?d1)
            (day_after ?d1 ?d2)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
            (increase (k-stays) 1)
        )
    )
    
    ; --- Travel Actions ---
    
    (:action travel_LF
        :parameters (?d1 ?d2 - day)
        :precondition (and
            (at lyon)
            (connected lyon frankfurt)
            (current_day ?d1)
            (day_after ?d1 ?d2)
            (not (is_fixed_k_day ?d1))
        )
        :effect (and
            (not (at lyon))
            (at frankfurt)
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
        )
    )
    
    (:action travel_FL
        :parameters (?d1 ?d2 - day)
        :precondition (and
            (at frankfurt)
            (connected frankfurt lyon)
            (current_day ?d1)
            (day_after ?d1 ?d2)
            (not (is_fixed_k_day ?d1))
        )
        :effect (and
            (not (at frankfurt))
            (at lyon)
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
        )
    )

    (:action travel_FK
        :parameters (?d1 ?d2 - day)
        :precondition (and
            (at frankfurt)
            (connected frankfurt krakow)
            (current_day ?d1)
            (day_after ?d1 ?d2)
            (not (is_fixed_k_day ?d1))
        )
        :effect (and
            (not (at frankfurt))
            (at krakow)
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
        )
    )

    (:action travel_KF
        :parameters (?d1 ?d2 - day)
        :precondition (and
            (at krakow)
            (connected krakow frankfurt)
            (current_day ?d1)
            (day_after ?d1 ?d2)
            (not (is_fixed_k_day ?d1))
        )
        :effect (and
            (not (at krakow))
            (at frankfurt)
            (not (current_day ?d1))
            (current_day ?d2)
            (increase (total-cost) 1)
        )
    )
)