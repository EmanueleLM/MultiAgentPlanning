(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city day count)

    (:predicates
        (at ?c - city)
        (direct-flight ?c1 - city ?c2 - city)
        (current-day ?d - day)
        (next-day ?d1 - day ?d2 - day)
        
        ; Stay counting 
        (count-L ?n - count)
        (count-B ?n - count)
        (count-R ?n - count)
        (next-count ?n1 - count ?n2 - count)

        ; Goal tracking
        (workshop-attended)
    )

    (:functions (total-cost))

    ; --- Stay Actions for London (Target C3, Restricted to D1-D4) ---

    (:action stay_L_inc
        :parameters (?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and 
            (at LONDON) 
            (current-day ?d) 
            (next-day ?d ?dn) 
            (count-L ?n) 
            (next-count ?n ?nn)
            (not (count-L c3))
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (count-L ?n)) (count-L ?nn)
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )
    
    (:action stay_L_hold
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at LONDON) 
            (current-day ?d) 
            (next-day ?d ?dn) 
            (count-L c3)
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )

    ; --- Stay Actions for Bucharest (Target C3, Restricted to D1-D4) ---

    (:action stay_B_inc
        :parameters (?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and 
            (at BUCHAREST) 
            (current-day ?d) 
            (next-day ?d ?dn) 
            (count-B ?n) 
            (next-count ?n ?nn)
            (not (count-B c3))
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (count-B ?n)) (count-B ?nn)
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )
    
    (:action stay_B_hold
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at BUCHAREST) 
            (current-day ?d) 
            (next-day ?d ?dn) 
            (count-B c3)
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )

    ; --- Stay Actions for Riga (Early Stays D1-D4) ---

    (:action stay_R_early_inc
        :parameters (?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and 
            (at RIGA) 
            (current-day ?d) (next-day ?d ?dn) 
            (count-R ?n) (next-count ?n ?nn)
            (not (count-R c4))
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (count-R ?n)) (count-R ?nn)
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )

    (:action stay_R_early_hold
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at RIGA) 
            (current-day ?d) (next-day ?d ?dn) 
            (count-R c4)
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )

    ; --- Stay Actions for Riga Workshop (Mandatory D5 - D8) ---
    
    ; D5, D6, D7 transitions (to D6, D7, D8)
    
    (:action stay_R_D5_D7_inc
        :parameters (?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and
            (at RIGA)
            (current-day ?d)
            (next-day ?d ?dn)
            ; Restrict ?d to D5, D6, D7 (Exclude D1-D4, Exclude D8):
            (not (current-day d1)) (not (current-day d2)) (not (current-day d3)) (not (current-day d4))
            (not (current-day d8))
            (count-R ?n) (next-count ?n ?nn)
            (not (count-R c4))
        )
        :effect (and
            (not (count-R ?n)) (count-R ?nn)
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )

    (:action stay_R_D5_D7_hold
        :parameters (?d - day ?dn - day)
        :precondition (and
            (at RIGA)
            (current-day ?d)
            (next-day ?d ?dn)
            ; Restrict ?d to D5, D6, D7:
            (not (current-day d1)) (not (current-day d2)) (not (current-day d3)) (not (current-day d4))
            (not (current-day d8))
            (count-R c4)
        )
        :effect (and
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )

    ; D8 transition (Final day, guarantees workshop attendance predicate)
    
    (:action stay_R_D8_final_inc
        :parameters (?d - day ?dn - day ?n - count ?nn - count)
        :precondition (and 
            (at RIGA) 
            (current-day ?d) (next-day ?d ?dn)
            ; Restrict ?d to D8 (Exclude D1-D7):
            (not (current-day d1)) (not (current-day d2)) (not (current-day d3)) (not (current-day d4)) 
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7))
            (count-R ?n) (next-count ?n ?nn) 
            (not (count-R c4))
        )
        :effect (and 
            (not (count-R ?n)) (count-R ?nn)
            (not (current-day ?d)) (current-day ?dn)
            (workshop-attended)
            (increase (total-cost) 1)
        )
    )
    (:action stay_R_D8_final_hold
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at RIGA) 
            (current-day ?d) (next-day ?d ?dn)
            ; Restrict ?d to D8:
            (not (current-day d1)) (not (current-day d2)) (not (current-day d3)) (not (current-day d4)) 
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7))
            (count-R c4)
        )
        :effect (and 
            (not (current-day ?d)) (current-day ?dn)
            (workshop-attended)
            (increase (total-cost) 1)
        )
    )

    ; --- Travel Actions (1 day duration, Restricted to D1-D4 departure) ---

    ; L <-> B
    (:action travel_L_B
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at LONDON) 
            (direct-flight LONDON BUCHAREST) 
            (current-day ?d) (next-day ?d ?dn) 
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (at LONDON)) (at BUCHAREST) 
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )
    (:action travel_B_L
        :parameters (?d - day ?dn - day)
        :precondition (and 
            (at BUCHAREST) 
            (direct-flight BUCHAREST LONDON) 
            (current-day ?d) (next-day ?d ?dn) 
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and 
            (not (at BUCHAREST)) (at LONDON) 
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )
    
    ; B <-> R
    
    (:action travel_B_R
        :parameters (?d - day ?dn - day)
        :precondition (and
            (at BUCHAREST)
            (direct-flight BUCHAREST RIGA)
            (current-day ?d) (next-day ?d ?dn)
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and
            (not (at BUCHAREST)) (at RIGA)
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )
    
    (:action travel_R_B
        :parameters (?d - day ?dn - day)
        :precondition (and
            (at RIGA)
            (direct-flight RIGA BUCHAREST)
            (current-day ?d) (next-day ?d ?dn)
            ; Restriction D1-D4
            (not (current-day d5)) (not (current-day d6)) (not (current-day d7)) (not (current-day d8))
        )
        :effect (and
            (not (at RIGA)) (at BUCHAREST)
            (not (current-day ?d)) (current-day ?dn)
            (increase (total-cost) 1)
        )
    )
)