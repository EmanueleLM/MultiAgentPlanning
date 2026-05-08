(define (domain TripPlanning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        day_marker
    )
    (:constants
        prague vienna porto - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day_marker ; d10 is the end marker after 9 days
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day_marker)
        (next_day ?d1 - day_marker ?d2 - day_marker)
        (visited_prague_d1) ; Ensures workshop constraint D1
        (visited_prague_d2) ; Ensures workshop constraint D2
        (visited_prague_d3) ; Ensures workshop constraint D3
    )
    (:functions
        (days_in_city ?c - city)
        (total-cost)
    )

    ;; --- 1. SPEND DAY ACTIONS (Stay) ---
    ;; These actions advance the day marker and increment the city duration count.

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
            (increase (days_in_city prague) 1)
            ;; Conditional effects to mark workshop attendance during D1-D3
            (when (= ?d1 d1) (visited_prague_d1))
            (when (= ?d1 d2) (visited_prague_d2))
            (when (= ?d1 d3) (visited_prague_d3))
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
            (increase (days_in_city porto) 1)
        )
    )

    ;; --- 2. TRAVEL ACTIONS (Instantaneous change of location based on connectivity) ---
    ;; Travel increases total-cost but does not advance the day marker.

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
    (:action travel_V_R
        :parameters ()
        :precondition (at vienna)
        :effect (and
            (not (at vienna))
            (at porto)
            (increase (total-cost) 1)
        )
    )

    (:action travel_R_V
        :parameters ()
        :precondition (at porto)
        :effect (and
            (not (at porto))
            (at vienna)
            (increase (total-cost) 1)
        )
    )
)