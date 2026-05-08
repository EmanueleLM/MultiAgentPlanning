(define (domain trip-planning-orchestrator)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        city 
        day 
        count ; C0 up to C7
    )
    
    (:constants
        frankfurt berlin bucharest - city
        
        ; Days D1 to D12 (11 actions lead from D1 state to D12 state)
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
        
        ; Counters C0 to C7 (Maximum needed count is 7)
        c0 c1 c2 c3 c4 c5 c6 c7 - count
    )

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        
        ; Time tracking
        (current-day ?d - day)
        (next-day ?d1 - day ?d2 - day)

        (day-is-in-show-window ?d - day)

        ; Duration tracking (exact counts)
        (days-in-frankfurt ?cf - count)
        (days-in-bucharest ?cbu - count)
        (days-in-berlin-show ?cb - count) 
        
        ; frankfurt-min-met now defined at C1 (1 day stay)
        (frankfurt-min-met) 
        ; bucharest-min-met now defined at C1 (1 day stay)
        (bucharest-min-met)
    )
    
    (:functions
        (total-cost)
    )

    ; Action: Travel (takes 1 day)
    (:action travel
        :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (current-day ?d1)
            (next-day ?d1 ?d2)
            (not (current-day d12)) 
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current-day ?d1))
            (current-day ?d2)
            (increase (total-cost) 1)
        )
    )

    ; --- Stay Actions for Frankfurt (Relaxed to >= 1 day, C1) ---

    (:action stay_frankfurt_c0_c1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at frankfurt) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (days-in-frankfurt c0))
        :effect (and 
            (not (current-day ?d1)) (current-day ?d2) 
            (not (days-in-frankfurt c0)) (days-in-frankfurt c1) 
            (frankfurt-min-met) ; SET MIN MET HERE (C1)
            (increase (total-cost) 1)
        )
    )
    (:action stay_frankfurt_c1_c2
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at frankfurt) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (days-in-frankfurt c1))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-frankfurt c1)) (days-in-frankfurt c2) (increase (total-cost) 1))
    )
    (:action stay_frankfurt_c2_c3
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at frankfurt) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (days-in-frankfurt c2))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-frankfurt c2)) (days-in-frankfurt c3) (increase (total-cost) 1))
    )
    (:action stay_frankfurt_c3_c4
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at frankfurt) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (days-in-frankfurt c3))
        :effect (and 
            (not (current-day ?d1)) (current-day ?d2) 
            (not (days-in-frankfurt c3)) (days-in-frankfurt c4) 
            (increase (total-cost) 1)
        )
    )
    (:action stay_frankfurt_post_min
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at frankfurt) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (frankfurt-min-met))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (increase (total-cost) 1))
    )

    ; --- Stay Actions for Bucharest (Relaxed to >= 1 day, C1) ---

    (:action stay_bucharest_c0_c1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at bucharest) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (days-in-bucharest c0))
        :effect (and 
            (not (current-day ?d1)) (current-day ?d2) 
            (not (days-in-bucharest c0)) (days-in-bucharest c1) 
            (bucharest-min-met) ; SET MIN MET HERE (C1)
            (increase (total-cost) 1)
        )
    )
    (:action stay_bucharest_c1_c2
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at bucharest) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (days-in-bucharest c1))
        :effect (and 
            (not (current-day ?d1)) (current-day ?d2) 
            (not (days-in-bucharest c1)) (days-in-bucharest c2) 
            (increase (total-cost) 1)
        )
    )
    (:action stay_bucharest_post_min
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at bucharest) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (bucharest-min-met))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (increase (total-cost) 1))
    )
    
    ; --- Stay Actions for Berlin (Required: = 7 days, D1-D7 window) ---

    ; Added (not (current-day d12)) for consistency.
    (:action stay_berlin_c0_c1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at berlin) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (day-is-in-show-window ?d1) (days-in-berlin-show c0))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-berlin-show c0)) (days-in-berlin-show c1) (increase (total-cost) 1))
    )
    (:action stay_berlin_c1_c2
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at berlin) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (day-is-in-show-window ?d1) (days-in-berlin-show c1))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-berlin-show c1)) (days-in-berlin-show c2) (increase (total-cost) 1))
    )
    (:action stay_berlin_c2_c3
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at berlin) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (day-is-in-show-window ?d1) (days-in-berlin-show c2))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-berlin-show c2)) (days-in-berlin-show c3) (increase (total-cost) 1))
    )
    (:action stay_berlin_c3_c4
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at berlin) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (day-is-in-show-window ?d1) (days-in-berlin-show c3))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-berlin-show c3)) (days-in-berlin-show c4) (increase (total-cost) 1))
    )
    (:action stay_berlin_c4_c5
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at berlin) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (day-is-in-show-window ?d1) (days-in-berlin-show c4))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-berlin-show c4)) (days-in-berlin-show c5) (increase (total-cost) 1))
    )
    (:action stay_berlin_c5_c6
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at berlin) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (day-is-in-show-window ?d1) (days-in-berlin-show c5))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-berlin-show c5)) (days-in-berlin-show c6) (increase (total-cost) 1))
    )
    (:action stay_berlin_c6_c7
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (at berlin) (current-day ?d1) (next-day ?d1 ?d2) (not (current-day d12)) (day-is-in-show-window ?d1) (days-in-berlin-show c6))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (not (days-in-berlin-show c6)) (days-in-berlin-show c7) (increase (total-cost) 1))
    )
    
    ; Post-Show Stay in Berlin (Only available on days D8-D11)
    (:action stay_berlin_post_show
        :parameters (?d1 - day ?d2 - day)
        :precondition (and 
            (at berlin) 
            (current-day ?d1) 
            (next-day ?d1 ?d2)
            (not (day-is-in-show-window ?d1)) ; Must be D8 to D11
            (not (current-day d12))
        )
        :effect (and
            (not (current-day ?d1))
            (current-day ?d2)
            (increase (total-cost) 1)
        )
    )
)