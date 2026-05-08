(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day count)

    (:predicates
        (at ?c - city)
        (direct-flight ?c1 - city ?c2 - city)
        (current-day ?d - day)
        (next-day ?d1 - day ?d2 - day)
        
        ; Stay counting (L/B up to c3, R up to c4)
        (count-L ?n - count)
        (count-B ?n - count)
        (count-R ?n - count)
        (next-count ?n1 - count ?n2 - count)

        ; Goal tracking
        (workshop-attended)
    )

    ; --- Stay Actions for London (Target C3) ---

    (:action stay_L_inc
        :parameters (?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and 
            (at london) 
            (current-day ?d) 
            (next-day ?d ?dn) 
            (count-L ?n) 
            (next-count ?n ?nn)
            (not (count-L c3))
        )
        :effect (and 
            (not (count-L ?n)) (count-L ?nn)
            (not (current-day ?d)) (current-day ?dn)
        )
    )
    
    (:action stay_L_hold
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at london) 
            (current-day ?d) 
            (next-day ?d ?dn) 
            (count-L c3)
        )
        :effect (and 
            (not (current-day ?d)) (current-day ?dn)
        )
    )

    ; --- Stay Actions for Bucharest (Target C3) ---

    (:action stay_B_inc
        :parameters (?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and 
            (at bucharest) 
            (current-day ?d) 
            (next-day ?d ?dn) 
            (count-B ?n) 
            (next-count ?n ?nn)
            (not (count-B c3))
        )
        :effect (and 
            (not (count-B ?n)) (count-B ?nn)
            (not (current-day ?d)) (current-day ?dn)
        )
    )
    
    (:action stay_B_hold
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at bucharest) 
            (current-day ?d) 
            (next-day ?d ?dn) 
            (count-B c3)
        )
        :effect (and 
            (not (current-day ?d)) (current-day ?dn)
        )
    )

    ; --- Stay Actions for Riga (General D1-D4) ---

    (:action stay_R_early_inc
        :parameters (?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and 
            (at riga) 
            (current-day ?d) (next-day ?d ?dn) 
            (count-R ?n) (next-count ?n ?nn)
            (not (count-R c4))
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (count-R ?n)) (count-R ?nn)
            (not (current-day ?d)) (current-day ?dn)
        )
    )

    (:action stay_R_early_hold
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at riga) 
            (current-day ?d) (next-day ?d ?dn) 
            (count-R c4)
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (current-day ?d)) (current-day ?dn)
        )
    )

    ; --- Stay Actions for Riga Workshop (D5 - D8) ---
    ; D5
    (:action stay_R_D5_inc
        :parameters (?n - count ?nn - count)
        :precondition (and (at riga) (current-day d5) (next-day d5 d6) (count-R ?n) (next-count ?n ?nn) (not (count-R c4)))
        :effect (and (not (count-R ?n)) (count-R ?nn) (not (current-day d5)) (current-day d6))
    )
    (:action stay_R_D5_c4_reached
        :precondition (and (at riga) (current-day d5) (next-day d5 d6) (count-R c4))
        :effect (and (not (current-day d5)) (current-day d6))
    )
    
    ; D6
    (:action stay_R_D6_inc
        :parameters (?n - count ?nn - count)
        :precondition (and (at riga) (current-day d6) (next-day d6 d7) (count-R ?n) (next-count ?n ?nn) (not (count-R c4)))
        :effect (and (not (count-R ?n)) (count-R ?nn) (not (current-day d6)) (current-day d7))
    )
    (:action stay_R_D6_c4_reached
        :precondition (and (at riga) (current-day d6) (next-day d6 d7) (count-R c4))
        :effect (and (not (current-day d6)) (current-day d7))
    )
    
    ; D7
    (:action stay_R_D7_inc
        :parameters (?n - count ?nn - count)
        :precondition (and (at riga) (current-day d7) (next-day d7 d8) (count-R ?n) (next-count ?n ?nn) (not (count-R c4)))
        :effect (and (not (count-R ?n)) (count-R ?nn) (not (current-day d7)) (current-day d8))
    )
    (:action stay_R_D7_c4_reached
        :precondition (and (at riga) (current-day d7) (next-day d7 d8) (count-R c4))
        :effect (and (not (current-day d7)) (current-day d8))
    )
    
    ; D8 (Final day, guarantees workshop attendance predicate)
    (:action stay_R_D8_final
        :parameters (?n - count ?nn - count)
        :precondition (and (at riga) (current-day d8) (next-day d8 d9) (count-R ?n) (next-count ?n ?nn) (not (count-R c4)))
        :effect (and 
            (not (count-R ?n)) (count-R ?nn)
            (not (current-day d8)) (current-day d9)
            (workshop-attended)
        )
    )
    (:action stay_R_D8_final_c4_reached
        :precondition (and (at riga) (current-day d8) (next-day d8 d9) (count-R c4))
        :effect (and 
            (not (current-day d8)) (current-day d9)
            (workshop-attended)
        )
    )

    ; --- Travel Actions (1 day duration) ---

    ; L <-> B
    (:action travel_L_B
        :parameters (?d - day ?dn - day)
        :precondition (and (at london) (direct-flight london bucharest) (current-day ?d) (next-day ?d ?dn) (not (current-day d8)))
        :effect (and (not (at london)) (at bucharest) (not (current-day ?d)) (current-day ?dn))
    )
    (:action travel_B_L
        :parameters (?d - day ?dn - day)
        :precondition (and (at bucharest) (direct-flight bucharest london) (current-day ?d) (next-day ?d ?dn) (not (current-day d8)))
        :effect (and (not (at bucharest)) (at london) (not (current-day ?d)) (current-day ?dn))
    )
    
    ; B <-> R. Movement restricted D5-D8.
    
    ; Travel B -> R: Must depart D4 or earlier.
    (:action travel_B_R
        :parameters (?d - day ?dn - day)
        :precondition (and
            (at bucharest)
            (direct-flight bucharest riga)
            (current-day ?d) (next-day ?d ?dn)
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and
            (not (at bucharest)) (at riga)
            (not (current-day ?d)) (current-day ?dn)
        )
    )
    
    ; Travel R -> B: Must depart D4 or earlier.
    (:action travel_R_B
        :parameters (?d - day ?dn - day)
        :precondition (and
            (at riga)
            (direct-flight riga bucharest)
            (current-day ?d) (next-day ?d ?dn)
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and
            (not (at riga)) (at bucharest)
            (not (current-day ?d)) (current-day ?dn)
        )
    )
)