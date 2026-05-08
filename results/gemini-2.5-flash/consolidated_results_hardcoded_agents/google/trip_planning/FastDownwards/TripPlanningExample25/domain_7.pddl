(define (domain TripPlanning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city day)
    
    (:predicates
        (is-next ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (is-current-day ?d - day)
        (at ?c - city) ; Agent's location
        (must-be-in-split ?d - day) ; Marker for D10 to D16
    )
    
    (:functions
        (days-v)
        (days-l)
        (days-s)
        (total-trip-days)
        (total-cost)
    )
    
    ;; --- Stay Actions: Location remains the same, day count increments ---

    (:action stay_V
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (at V) 
            (is-current-day ?d1) 
            (is-next ?d1 ?d2)
            (not (must-be-in-split ?d2)) ; Cannot stay in V if D2 must be in S
        )
        :effect (and 
            (not (is-current-day ?d1))
            (is-current-day ?d2)
            (increase (days-v) 1)
            (increase (total-trip-days) 1)
            (increase (total-cost) 1) 
        )
    )
    
    (:action stay_L
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (at L) 
            (is-current-day ?d1) 
            (is-next ?d1 ?d2)
            (not (must-be-in-split ?d2)) ; Cannot stay in L if D2 must be in S
        )
        :effect (and 
            (not (is-current-day ?d1))
            (is-current-day ?d2)
            (increase (days-l) 1)
            (increase (total-trip-days) 1)
            (increase (total-cost) 1) 
        )
    )
    
    (:action stay_S
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (at S) 
            (is-current-day ?d1) 
            (is-next ?d1 ?d2)
        )
        :effect (and 
            (not (is-current-day ?d1))
            (is-current-day ?d2)
            (increase (days-s) 1)
            (increase (total-trip-days) 1)
            (increase (total-cost) 1) 
        )
    )

    ;; --- Travel Actions: Location changes, day count increments for arrival city D2 ---

    ; Travel (V -> L)
    (:action travel_V_L
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (at V) 
            (connected V L)
            (is-current-day ?d1) 
            (is-next ?d1 ?d2)
            (not (must-be-in-split ?d2)) ; Cannot arrive at L if D2 must be in S
        )
        :effect (and 
            (not (at V))
            (at L)
            (not (is-current-day ?d1))
            (is-current-day ?d2)
            (increase (days-l) 1)
            (increase (total-trip-days) 1)
            (increase (total-cost) 1) 
        )
    )

    ; Travel (L -> V)
    (:action travel_L_V
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (at L) 
            (connected L V)
            (is-current-day ?d1) 
            (is-next ?d1 ?d2)
            (not (must-be-in-split ?d2)) ; Cannot arrive at V if D2 must be in S
        )
        :effect (and 
            (not (at L))
            (at V)
            (not (is-current-day ?d1))
            (is-current-day ?d2)
            (increase (days-v) 1)
            (increase (total-trip-days) 1)
            (increase (total-cost) 1) 
        )
    )

    ; Travel (L -> S)
    (:action travel_L_S
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (at L) 
            (connected L S)
            (is-current-day ?d1) 
            (is-next ?d1 ?d2)
        )
        :effect (and 
            (not (at L))
            (at S)
            (not (is-current-day ?d1))
            (is-current-day ?d2)
            (increase (days-s) 1)
            (increase (total-trip-days) 1)
            (increase (total-cost) 1) 
        )
    )

    ; Travel (S -> L)
    (:action travel_S_L
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (at S) 
            (connected S L)
            (is-current-day ?d1) 
            (is-next ?d1 ?d2)
            (not (must-be-in-split ?d2)) ; Cannot arrive at L if D2 must be in S
        )
        :effect (and 
            (not (at S))
            (at L)
            (not (is-current-day ?d1))
            (is-current-day ?d2)
            (increase (days-l) 1)
            (increase (total-trip-days) 1)
            (increase (total-cost) 1) 
        )
    )
)