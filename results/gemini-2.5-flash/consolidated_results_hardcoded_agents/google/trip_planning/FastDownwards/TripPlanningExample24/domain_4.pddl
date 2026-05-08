(define (domain trip-planning-24)
    (:requirements :strips :typing :negative-preconditions)

    (:types
        city
        day
        stay-count
    )

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        (current-day ?d - day)
        
        ; Track days spent in each city: C0=0 days spent, C4=4 days spent
        (F-stay ?s - stay-count) ; Required 4 days
        (A-stay ?s - stay-count) ; Required 4 days
        (R-stay ?s - stay-count) ; Required 3 days
    )

    ;; Florence Stay (Must occur D1, D2, D3, D4 due to workshop constraint)
    (:action stay-in-florence-D1
        :parameters ()
        :precondition (and (at florence) (current-day D1) (F-stay C0))
        :effect (and 
            (not (current-day D1)) (current-day D2)
            (not (F-stay C0)) (F-stay C1)
        )
    )
    (:action stay-in-florence-D2
        :parameters ()
        :precondition (and (at florence) (current-day D2) (F-stay C1))
        :effect (and 
            (not (current-day D2)) (current-day D3)
            (not (F-stay C1)) (F-stay C2)
        )
    )
    (:action stay-in-florence-D3
        :parameters ()
        :precondition (and (at florence) (current-day D3) (F-stay C2))
        :effect (and 
            (not (current-day D3)) (current-day D4)
            (not (F-stay C2)) (F-stay C3)
        )
    )
    (:action stay-in-florence-D4
        :parameters ()
        :precondition (and (at florence) (current-day D4) (F-stay C3))
        :effect (and 
            (not (current-day D4)) (current-day D5)
            (not (F-stay C3)) (F-stay C4) ; F stay completed
        )
    )

    ;; Travel F -> A (Must occur D5)
    (:action travel-F-A
        :parameters ()
        :precondition (and 
            (at florence) 
            (connected florence amsterdam) 
            (current-day D5) 
            (F-stay C4) 
        )
        :effect (and
            (not (at florence))
            (at amsterdam)
            (not (current-day D5))
            (current-day D6) ; Day 6 starts
        )
    )

    ;; Amsterdam Stay (Must occur D6, D7, D8, D9)
    (:action stay-in-amsterdam-D6
        :parameters ()
        :precondition (and (at amsterdam) (current-day D6) (A-stay C0))
        :effect (and 
            (not (current-day D6)) (current-day D7)
            (not (A-stay C0)) (A-stay C1)
        )
    )
    (:action stay-in-amsterdam-D7
        :parameters ()
        :precondition (and (at amsterdam) (current-day D7) (A-stay C1))
        :effect (and 
            (not (current-day D7)) (current-day D8)
            (not (A-stay C1)) (A-stay C2)
        )
    )
    (:action stay-in-amsterdam-D8
        :parameters ()
        :precondition (and (at amsterdam) (current-day D8) (A-stay C2))
        :effect (and 
            (not (current-day D8)) (current-day D9)
            (not (A-stay C2)) (A-stay C3)
        )
    )
    (:action stay-in-amsterdam-D9
        :parameters ()
        :precondition (and (at amsterdam) (current-day D9) (A-stay C3))
        :effect (and 
            (not (current-day D9)) (current-day D10)
            (not (A-stay C3)) (A-stay C4) ; A stay completed
        )
    )

    ;; Travel A -> R (Must occur D10)
    (:action travel-A-R
        :parameters ()
        :precondition (and 
            (at amsterdam) 
            (connected amsterdam riga) 
            (current-day D10) 
            (A-stay C4) 
        )
        :effect (and
            (not (at amsterdam))
            (at riga)
            (not (current-day D10))
            (current-day D11) ; Day 11 starts
        )
    )

    ;; Riga Stay (Must occur D11, D12, D13)
    (:action stay-in-riga-D11
        :parameters ()
        :precondition (and (at riga) (current-day D11) (R-stay C0))
        :effect (and 
            (not (current-day D11)) (current-day D12)
            (not (R-stay C0)) (R-stay C1)
        )
    )
    (:action stay-in-riga-D12
        :parameters ()
        :precondition (and (at riga) (current-day D12) (R-stay C1))
        :effect (and 
            (not (current-day D12)) (current-day D13)
            (not (R-stay C1)) (R-stay C2)
        )
    )
    (:action stay-in-riga-D13
        :parameters ()
        :precondition (and (at riga) (current-day D13) (R-stay C2))
        :effect (and 
            (not (current-day D13)) (current-day D14) ; Trip completed after D13
            (not (R-stay C2)) (R-stay C3) ; R stay completed (3 days)
        )
    )
)