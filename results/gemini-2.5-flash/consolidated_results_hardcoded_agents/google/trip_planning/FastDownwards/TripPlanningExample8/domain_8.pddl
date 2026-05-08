(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types 
        city 
        day_counter 
        count ; Used for tracking stay progress (N0 to N7)
    )

    (:constants
        KRAKOW ATHENS ZURICH - city
        ; Days D1-D18 required for 18 days of activities + travel
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 D15 D16 D17 D18 - day_counter
        ; Stay counts (N0 to N7 needed for Athens 7 days)
        N0 N1 N2 N3 N4 N5 N6 N7 - count
    )

    (:predicates
        (at ?c - city)
        (flight ?c1 - city ?c2 - city)
        
        ; Time tracking
        (current-day ?d - day_counter)
        (next-day ?d1 - day_counter ?d2 - day_counter)
        
        ; Stay progress tracking (N counts)
        (stay-krakow-progress ?n - count) ; Max N6
        (stay-athens-progress ?n - count) ; Max N7
        (stay-zurich-progress ?n - count) ; Max N5
        (next-count ?n1 - count ?n2 - count)
    )

    (:functions
        (total-cost)
    )
    
    ; --- TRAVEL ACTIONS (Advance day by 1, Cost 1) ---

    (:action travel-zurich-krakow
        :parameters (?d1 - day_counter ?d2 - day_counter)
        :precondition (and (at ZURICH) 
                           (flight ZURICH KRAKOW)
                           (current-day ?d1)
                           (next-day ?d1 ?d2)
        )
        :effect (and (not (at ZURICH))
                     (at KRAKOW)
                     (not (current-day ?d1))
                     (current-day ?d2)
                     (increase (total-cost) 1)
        )
    )
    (:action travel-krakow-zurich
        :parameters (?d1 - day_counter ?d2 - day_counter)
        :precondition (and (at KRAKOW) 
                           (flight KRAKOW ZURICH)
                           (current-day ?d1)
                           (next-day ?d1 ?d2)
        )
        :effect (and (not (at KRAKOW))
                     (at ZURICH)
                     (not (current-day ?d1))
                     (current-day ?d2)
                     (increase (total-cost) 1)
        )
    )
    
    (:action travel-zurich-athens
        :parameters (?d1 - day_counter ?d2 - day_counter)
        :precondition (and (at ZURICH) 
                           (flight ZURICH ATHENS)
                           (current-day ?d1)
                           (next-day ?d1 ?d2)
        )
        :effect (and (not (at ZURICH))
                     (at ATHENS)
                     (not (current-day ?d1))
                     (current-day ?d2)
                     (increase (total-cost) 1)
        )
    )
    (:action travel-athens-zurich
        :parameters (?d1 - day_counter ?d2 - day_counter)
        :precondition (and (at ATHENS) 
                           (flight ATHENS ZURICH)
                           (current-day ?d1)
                           (next-day ?d1 ?d2)
        )
        :effect (and (not (at ATHENS))
                     (at ZURICH)
                     (not (current-day ?d1))
                     (current-day ?d2)
                     (increase (total-cost) 1)
        )
    )

    ; --- STAY ACTIONS (Advance day by 1, Progress stay count by 1, Cost 1) ---

    ; Stay Krakow (6 days required, N0 to N6)
    (:action stay-krakow
        :parameters (?d1 - day_counter ?d2 - day_counter ?n1 - count ?n2 - count)
        :precondition (and (at KRAKOW)
                           (current-day ?d1)
                           (next-day ?d1 ?d2)
                           (stay-krakow-progress ?n1)
                           (next-count ?n1 ?n2)
                           (not (stay-krakow-progress N6)) ; Stop once 6 days are reached
        )
        :effect (and (not (stay-krakow-progress ?n1))
                     (stay-krakow-progress ?n2)
                     (not (current-day ?d1))
                     (current-day ?d2)
                     (increase (total-cost) 1)
        )
    )

    ; Stay Zurich (5 days required, N0 to N5)
    (:action stay-zurich
        :parameters (?d1 - day_counter ?d2 - day_counter ?n1 - count ?n2 - count)
        :precondition (and (at ZURICH)
                           (current-day ?d1)
                           (next-day ?d1 ?d2)
                           (stay-zurich-progress ?n1)
                           (next-count ?n1 ?n2)
                           (not (stay-zurich-progress N5)) ; Stop once 5 days are reached
        )
        :effect (and (not (stay-zurich-progress ?n1))
                     (stay-zurich-progress ?n2)
                     (not (current-day ?d1))
                     (current-day ?d2)
                     (increase (total-cost) 1)
        )
    )

    ; Stay Athens (7 days required, N0 to N7). Must start on D1 through D7.
    (:action stay-athens
        :parameters (?d1 - day_counter ?d2 - day_counter ?n1 - count ?n2 - count)
        :precondition (and (at ATHENS)
                           (current-day ?d1)
                           (next-day ?d1 ?d2)
                           (stay-athens-progress ?n1)
                           (next-count ?n1 ?n2)
                           (not (stay-athens-progress N7)) ; Stop once 7 days are reached
                           
                           ; Constraint: Athens stay must start on D1 through D7. Block D8 onwards.
                           (not (current-day D8))
                           (not (current-day D9))
                           (not (current-day D10))
                           (not (current-day D11))
                           (not (current-day D12))
                           (not (current-day D13))
                           (not (current-day D14))
                           (not (current-day D15))
                           (not (current-day D16))
                           (not (current-day D17))
                           (not (current-day D18))
        )
        :effect (and (not (stay-athens-progress ?n1))
                     (stay-athens-progress ?n2)
                     (not (current-day ?d1))
                     (current-day ?d2)
                     (increase (total-cost) 1)
        )
    )
)