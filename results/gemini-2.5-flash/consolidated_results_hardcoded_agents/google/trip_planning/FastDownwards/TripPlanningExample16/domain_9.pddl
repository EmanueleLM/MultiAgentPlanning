(define (domain TripPlanning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        day_marker
    )
    (:constants
        prague vienna porto - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day_marker
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day_marker)
        (next_day ?d1 - day_marker ?d2 - day_marker)
        (stayed_at ?c - city ?d - day_marker)
    )
    (:functions
        (days_in_city ?c - city)
        (total-cost)
    )

    ;; --- 1. SPEND DAY ACTIONS (Stay) ---

    (:action spend_day_prague
        :parameters (?d1 - day_marker ?d2 - day_marker)
        :precondition (and
            (at prague)
            (current_day ?d1)
            (next_day ?d1 ?d2)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (stayed_at prague ?d1)
            (increase (days_in_city prague) 1)
        )
    )
    
    (:action spend_day_vienna
        :parameters (?d1 - day_marker ?d2 - day_marker)
        :precondition (and
            (at vienna)
            (current_day ?d1)
            (next_day ?d1 ?d2)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (stayed_at vienna ?d1)
            (increase (days_in_city vienna) 1)
        )
    )

    (:action spend_day_porto
        :parameters (?d1 - day_marker ?d2 - day_marker)
        :precondition (and
            (at porto)
            (current_day ?d1)
            (next_day ?d1 ?d2)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (stayed_at porto ?d1)
            (increase (days_in_city porto) 1)
        )
    )

    ;; --- 2. TRAVEL ACTIONS (Instantaneous change of location based on connectivity) ---
    
    ;; Prague <-> Vienna
    (:action travel_P_V
        :parameters ()
        :precondition (at prague)
        :effect (and
            (not (at prague))
            (at vienna)
            (increase (total-cost) 1)
        )
    )

    (:action travel_V_P
        :parameters ()
        :precondition (at vienna)
        :effect (and
            (not (at vienna))
            (at prague)
            (increase (total-cost) 1)
        )
    )

    ;; Vienna <-> Porto
    (:action travel_V_Porto
        :parameters ()
        :precondition (at vienna)
        :effect (and
            (not (at vienna))
            (at porto)
            (increase (total-cost) 1)
        )
    )

    (:action travel_Porto_V
        :parameters ()
        :precondition (at porto)
        :effect (and
            (not (at porto))
            (at vienna)
            (increase (total-cost) 1)
        )
    )
)