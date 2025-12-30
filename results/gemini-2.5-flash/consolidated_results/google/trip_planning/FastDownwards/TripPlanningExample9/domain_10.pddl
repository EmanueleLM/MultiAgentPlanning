(define (domain trip-planning-9)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        city - object
        day - object
    )
    (:constants 
        frankfurt bucharest stuttgart - city
    )
    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        (is-day ?d - day)
        (next-day ?d1 - day ?d2 - day)
        
        ; Helper predicates for penalty calculation completion
        (F-checked)
        (B-checked)
        
        ; Day classification for constraints
        (pre-workshop-day ?d - day)         
        (workshop-start-day ?d - day)       
        (workshop-mandatory-stay-day ?d - day) 
    )

    (:functions
        (total-cost) ; Accumulates Travel Cost + Duration Mismatch Penalty
        (stayed-frankfurt)
        (stayed-bucharest)
        (stayed-stuttgart)
    )

    ; Travel action (cost 1)
    (:action travel
        :parameters (?from - city ?to - city)
        :precondition (and 
            (at ?from)
            (connected ?from ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (increase (total-cost) 1) 
        )
    )

    ; --- Daily Progression Actions (D1 -> D10) ---

    ; 1. Stay on pre-workshop day (D1, D2, D3). Stay can be anywhere.
    (:action progress-day-pre-workshop-F
        :parameters (?d_from - day ?d_to - day)
        :precondition (and (is-day ?d_from) (next-day ?d_from ?d_to) (pre-workshop-day ?d_from) (at frankfurt))
        :effect (and (not (is-day ?d_from)) (is-day ?d_to) (increase (stayed-frankfurt) 1)) 
    )
    (:action progress-day-pre-workshop-B
        :parameters (?d_from - day ?d_to - day)
        :precondition (and (is-day ?d_from) (next-day ?d_from ?d_to) (pre-workshop-day ?d_from) (at bucharest))
        :effect (and (not (is-day ?d_from)) (is-day ?d_to) (increase (stayed-bucharest) 1)) 
    )
    (:action progress-day-pre-workshop-S
        :parameters (?d_from - day ?d_to - day)
        :precondition (and (is-day ?d_from) (next-day ?d_from ?d_to) (pre-workshop-day ?d_from) (at stuttgart))
        :effect (and (not (is-day ?d_from)) (is-day ?d_to) (increase (stayed-stuttgart) 1)) 
    )

    ; 2. Stay on D4 (Workshop Start). Must be in Stuttgart (Hard Constraint).
    (:action progress-day-workshop-start
        :parameters (?d_from - day ?d_to - day)
        :precondition (and
            (is-day ?d_from) (next-day ?d_from ?d_to) (workshop-start-day ?d_from) (at stuttgart) 
        )
        :effect (and
            (not (is-day ?d_from)) (is-day ?d_to) (increase (stayed-stuttgart) 1) 
        )
    )

    ; 3. Stay during workshop period (D5, D6, D7, D8, D9). Must stay in Stuttgart (Hard Constraint).
    (:action progress-day-workshop-mandatory
        :parameters (?d_from - day ?d_to - day)
        :precondition (and
            (is-day ?d_from) (next-day ?d_from ?d_to) (workshop-mandatory-stay-day ?d_from) (at stuttgart)
        )
        :effect (and
            (not (is-day ?d_from)) (is-day ?d_to) (increase (stayed-stuttgart) 1) 
        )
    )

    ; --- Duration Mismatch Penalties (Executed upon reaching D10) ---
    ; Penalty = desired - achieved. Total penalties minimize shortfall.

    ; F mismatch (Desired 3 days)
    (:action penalize-F-3-short 
        :precondition (and (is-day d10) (not (F-checked)) (= (stayed-frankfurt) 0))
        :effect (and (increase (total-cost) 3) (F-checked)) 
    )
    (:action penalize-F-2-short 
        :precondition (and (is-day d10) (not (F-checked)) (= (stayed-frankfurt) 1))
        :effect (and (increase (total-cost) 2) (F-checked)) 
    )
    (:action penalize-F-1-short 
        :precondition (and (is-day d10) (not (F-checked)) (= (stayed-frankfurt) 2))
        :effect (and (increase (total-cost) 1) (F-checked)) 
    )
    (:action finalize-F-check 
        :precondition (and (is-day d10) (not (F-checked)) (>= (stayed-frankfurt) 3))
        :effect (F-checked)
    )

    ; B mismatch (Desired 3 days)
    (:action penalize-B-3-short 
        :precondition (and (is-day d10) (not (B-checked)) (= (stayed-bucharest) 0))
        :effect (and (increase (total-cost) 3) (B-checked)) 
    )
    (:action penalize-B-2-short 
        :precondition (and (is-day d10) (not (B-checked)) (= (stayed-bucharest) 1))
        :effect (and (increase (total-cost) 2) (B-checked)) 
    )
    (:action penalize-B-1-short 
        :precondition (and (is-day d10) (not (B-checked)) (= (stayed-bucharest) 2))
        :effect (and (increase (total-cost) 1) (B-checked)) 
    )
    (:action finalize-B-check 
        :precondition (and (is-day d10) (not (B-checked)) (>= (stayed-bucharest) 3))
        :effect (B-checked)
    )