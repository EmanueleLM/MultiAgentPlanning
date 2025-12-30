(define (domain trip-planning-6)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
    )

    (:constants
        BER - city
        DUB - city
        MUN - city
    )

    (:predicates
        (at ?c - city)
        (current-day ?d - day)
        (next-day ?d1 - day ?d2 - day)
        (is-direct-flight ?c1 - city ?c2 - city)
        (spent-day ?c - city ?d - day)
        
        ; Time markers
        (final-day ?d - day)
        (goal-D8-reached) ; Marks successful completion of Day 8 and trip end

        ; Location constraint marker (Berlin required on D4)
        (required-at-berlin ?d - day)

        ; Duration counters (BER: 4, DUB: 3, MUN: 1)
        (ber-c1) (ber-c2) (ber-c3) (ber-c4)
        (dub-c1) (dub-c2) (dub-c3)
        (mun-c1)
    )

    ;; --- Transition Actions (Day D1 to D7) ---
    ;; Actions stop once the counter for the starting city reaches the target maximum.

    ; --- STAY BERLIN (C1=BER, Max 4) --- 
    
    (:action stay-ber-0-to-1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at BER) (not (ber-c1)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day BER ?d1) (ber-c1))
    )
    (:action stay-ber-1-to-2
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at BER) (ber-c1) (not (ber-c2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day BER ?d1) (not (ber-c1)) (ber-c2))
    )
    (:action stay-ber-2-to-3
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at BER) (ber-c2) (not (ber-c3)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day BER ?d1) (not (ber-c2)) (ber-c3))
    )
    (:action stay-ber-3-to-4
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at BER) (ber-c3) (not (ber-c4)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day BER ?d1) (not (ber-c3)) (ber-c4))
    )
    
    ; --- STAY DUBROVNIK (C1=DUB, Max 3) ---
    (:action stay-dub-0-to-1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at DUB) (not (dub-c1)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day DUB ?d1) (dub-c1))
    )
    (:action stay-dub-1-to-2
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at DUB) (dub-c1) (not (dub-c2)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day DUB ?d1) (not (dub-c1)) (dub-c2))
    )
    (:action stay-dub-2-to-3
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at DUB) (dub-c2) (not (dub-c3)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day DUB ?d1) (not (dub-c2)) (dub-c3))
    )

    ; --- STAY MUNICH (C1=MUN, Max 1) ---
    (:action stay-mun-0-to-1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at MUN) (not (mun-c1)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day MUN ?d1) (mun-c1))
    )
    
    ;; --- FLY ACTIONS (C1 -> C2) ---

    ; Fly BER -> MUN (Max BER count 4) 
    (:action fly-ber-to-mun-0-to-1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at BER) (is-direct-flight BER MUN) (not (ber-c1)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day BER ?d1) (not (at BER)) (at MUN) (ber-c1))
    )
    (:action fly-ber-to-mun-1-to-2
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at BER) (is-direct-flight BER MUN) (ber-c1) (not (ber-c2)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day BER ?d1) (not (at BER)) (at MUN) (not (ber-c1)) (ber-c2))
    )
    (:action fly-ber-to-mun-2-to-3
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at BER) (is-direct-flight BER MUN) (ber-c2) (not (ber-c3)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day BER ?d1) (not (at BER)) (at MUN) (not (ber-c2)) (ber-c3))
    )
    (:action fly-ber-to-mun-3-to-4
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at BER) (is-direct-flight BER MUN) (ber-c3) (not (ber-c4)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day BER ?d1) (not (at BER)) (at MUN) (not (ber-c3)) (ber-c4))
    )
    
    ; Fly DUB -> MUN (Max DUB count 3)
    (:action fly-dub-to-mun-0-to-1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at DUB) (is-direct-flight DUB MUN) (not (dub-c1)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day DUB ?d1) (not (at DUB)) (at MUN) (dub-c1))
    )
    (:action fly-dub-to-mun-1-to-2
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at DUB) (is-direct-flight DUB MUN) (dub-c1) (not (dub-c2)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day DUB ?d1) (not (at DUB)) (at MUN) (not (dub-c1)) (dub-c2))
    )
    (:action fly-dub-to-mun-2-to-3
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at DUB) (is-direct-flight DUB MUN) (dub-c2) (not (dub-c3)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day DUB ?d1) (not (at DUB)) (at MUN) (not (dub-c2)) (dub-c3))
    )

    ; Fly MUN -> BER (Max MUN count 1)
    (:action fly-mun-to-ber-0-to-1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at MUN) (is-direct-flight MUN BER) (not (mun-c1)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day MUN ?d1) (not (at MUN)) (at BER) (mun-c1))
    )
    
    ; Fly MUN -> DUB (Max MUN count 1)
    (:action fly-mun-to-dub-0-to-1
        :parameters (?d1 - day ?d2 - day)
        :precondition (and (current-day ?d1) (next-day ?d1 ?d2) (at MUN) (is-direct-flight MUN DUB) (not (mun-c1)) (not (required-at-berlin ?d2)) (not (final-day ?d1)))
        :effect (and (not (current-day ?d1)) (current-day ?d2) (spent-day MUN ?d1) (not (at MUN)) (at DUB) (mun-c1))
    )
    
    ;; --- Final Day Actions (Day 8 must be spent, sets goal marker) ---
    
    ; BER (Count 4 required)
    (:action spend-day-8-ber-3-to-4
        :parameters (?d - day)
        :precondition (and (current-day ?d) (final-day ?d) (at BER) (ber-c3) (not (ber-c4)))
        :effect (and (spent-day BER ?d) (not (ber-c3)) (ber-c4) (goal-D8-reached))
    )
    
    ; DUB (Count 3 required)
    (:action spend-day-8-dub-2-to-3
        :parameters (?d - day)
        :precondition (and (current-day ?d) (final-day ?d) (at DUB) (dub-c2) (not (dub-c3)))
        :effect (and (spent-day DUB ?d) (not (dub-c2)) (dub-c3) (goal-D8-reached))
    )

    ; MUN (Count 1 required)
    (:action spend-day-8-mun-0-to-1
        :parameters (?d - day)
        :precondition (and (current-day ?d) (final-day ?d) (at MUN) (not (mun-c1)))
        :effect (and (spent-day MUN ?d) (mun-c1) (goal-D8-reached))
    )
)