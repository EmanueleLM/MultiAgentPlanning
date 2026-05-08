(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        time
    )

    (:predicates
        (at ?c - city)
        (is-connected ?c1 - city ?c2 - city)
        (current-time ?t - time)
        (next-time ?t1 - time ?t2 - time)
        (visited ?c - city)

        ; Duration tracking for M (2 days)
        (M-day-1-done)
        (M-duration-met)

        ; Duration tracking for W (2 days)
        (W-day-1-done)
        (W-duration-met)

        ; Duration tracking for V (6 days)
        (V-day-1-done) (V-day-2-done) (V-day-3-done) 
        (V-day-4-done) (V-day-5-done)
        (V-duration-met) 
        
        ; Sequential phase markers (Enforcing M -> W -> V route)
        (M-phase)
        (W-phase)
        (V-phase)
    )

    ; --- PHASE 1: MYKONOS (2 days: T0->T1, T1->T2) ---

    (:action stay-mykonos-D1
        :parameters (?t1 - time ?t2 - time)
        :precondition (and 
            (at mykonos) (current-time ?t1) (next-time ?t1 ?t2) 
            (M-phase) (not (M-day-1-done))
            (current-time T0)
        )
        :effect (and 
            (not (current-time ?t1)) (current-time ?t2) 
            (M-day-1-done) (visited mykonos)
        )
    )

    (:action stay-mykonos-D2
        :parameters (?t1 - time ?t2 - time)
        :precondition (and 
            (at mykonos) (current-time ?t1) (next-time ?t1 ?t2) 
            (M-phase) (M-day-1-done) (not (M-duration-met))
            (current-time T1)
        )
        :effect (and 
            (not (current-time ?t1)) (current-time ?t2) 
            (M-duration-met)
        )
    )

    ; --- TRANSIT 1: M -> W (Instantaneous, at T2) ---
    
    (:action travel-M-W
        :parameters ()
        :precondition (and 
            (at mykonos) 
            (current-time T2) 
            (M-duration-met) 
            (is-connected mykonos vienna)
            (M-phase) (not (W-phase))
        )
        :effect (and 
            (not (at mykonos)) (at vienna) 
            (not (M-phase)) (W-phase)
        )
    )

    ; --- PHASE 2: VIENNA (2 days: T2->T3, T3->T4) ---
    
    (:action stay-vienna-D3
        :parameters (?t1 - time ?t2 - time)
        :precondition (and 
            (at vienna) (current-time ?t1) (next-time ?t1 ?t2) 
            (W-phase) (not (W-day-1-done)) 
            (current-time T2)
        )
        :effect (and 
            (not (current-time ?t1)) (current-time ?t2) 
            (W-day-1-done) (visited vienna)
        )
    )

    (:action stay-vienna-D4
        :parameters (?t1 - time ?t2 - time)
        :precondition (and 
            (at vienna) (current-time ?t1) (next-time ?t1 ?t2) 
            (W-phase) (W-day-1-done) (not (W-duration-met)) 
            (current-time T3)
        )
        :effect (and 
            (not (current-time ?t1)) (current-time ?t2) 
            (W-duration-met)
        )
    )
    
    ; --- TRANSIT 2: W -> V (Instantaneous, at T4) ---

    (:action travel-W-V
        :parameters ()
        :precondition (and 
            (at vienna) 
            (current-time T4) 
            (W-duration-met) 
            (is-connected vienna venice)
            (W-phase) (not (V-phase))
        )
        :effect (and 
            (not (at vienna)) (at venice) 
            (not (W-phase)) (V-phase)
        )
    )
    
    ; --- PHASE 3: VENICE (6 days: T4->T5, T5->T6, T6->T7, T7->T8, T8->T9, T9->T10) ---
    ; Workshop constraint: Must be in Venice Day 5 (T4->T5) through Day 10 (T9->T10).

    (:action stay-venice-D5
        :parameters (?t1 - time ?t2 - time)
        :precondition (and (at venice) (current-time ?t1) (next-time ?t1 ?t2) (V-phase) (not (V-day-1-done)) (current-time T4))
        :effect (and 
            (not (current-time ?t1)) (current-time ?t2) 
            (V-day-1-done) (visited venice)
        )
    )
    
    (:action stay-venice-D6
        :parameters (?t1 - time ?t2 - time)
        :precondition (and (at venice) (current-time ?t1) (next-time ?t1 ?t2) (V-day-1-done) (not (V-day-2-done)) (current-time T5))
        :effect (and (not (current-time ?t1)) (current-time ?t2) (V-day-2-done))
    )
    
    (:action stay-venice-D7
        :parameters (?t1 - time ?t2 - time)
        :precondition (and (at venice) (current-time ?t1) (next-time ?t1 ?t2) (V-day-2-done) (not (V-day-3-done)) (current-time T6))
        :effect (and (not (current-time ?t1)) (current-time ?t2) (V-day-3-done))
    )
    
    (:action stay-venice-D8
        :parameters (?t1 - time ?t2 - time)
        :precondition (and (at venice) (current-time ?t1) (next-time ?t1 ?t2) (V-day-3-done) (not (V-day-4-done)) (current-time T7))
        :effect (and (not (current-time ?t1)) (current-time ?t2) (V-day-4-done))
    )
    
    (:action stay-venice-D9
        :parameters (?t1 - time ?t2 - time)
        :precondition (and (at venice) (current-time ?t1) (next-time ?t1 ?t2) (V-day-4-done) (not (V-day-5-done)) (current-time T8))
        :effect (and (not (current-time ?t1)) (current-time ?t2) (V-day-5-done))
    )
    
    (:action stay-venice-D10
        :parameters (?t1 - time ?t2 - time)
        :precondition (and (at venice) (current-time ?t1) (next-time ?t1 ?t2) (V-day-5-done) (not (V-duration-met)) (current-time T9))
        :effect (and (not (current-time ?t1)) (current-time ?t2) (V-duration-met))
    )

)