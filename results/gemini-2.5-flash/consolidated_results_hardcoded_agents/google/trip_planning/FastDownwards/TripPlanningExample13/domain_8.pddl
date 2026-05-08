(define (domain integrated_trip_planning)
    (:requirements :strips :typing :negative-preconditions)

    (:types city timepoint stay_count)
    (:constants
        lyon bucharest manchester - city
    )

    (:predicates
        (at ?c - city)
        (direct-flight ?c1 ?c2 - city)
        (relatives-visited)
        (visited ?c - city)
        (at-time ?t - timepoint)
        (next-time ?t1 ?t2 - timepoint)
        
        ; Duration tracking (Max stays: M=7, L=5, B=5)
        (L-stay-count ?s - stay_count) 
        (B-stay-count ?s - stay_count) 
        (M-stay-count ?s - stay_count) 

        ; Time points T12 through T16 mark the start of days 13 through 17.
        (must-be-in-lyon ?t - timepoint)
    )

    ; 1. Instantaneous Travel Action: Travel does not consume a day.
    (:action fly
        :parameters (?from - city ?to - city ?t - timepoint)
        :precondition (and
            (at ?from)
            (at-time ?t)
            (direct-flight ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
        )
    )

    ; --- Manchester Stay Actions (M=7 required) ---
    ; Only allowed before the critical Lyon window (T0 to T11 transitions)
    (:action stay-manchester-d0-d1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count d0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count d0)) (M-stay-count d1))
    )
    (:action stay-manchester-d1-d2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count d1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count d1)) (M-stay-count d2))
    )
    (:action stay-manchester-d2-d3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count d2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count d2)) (M-stay-count d3))
    )
    (:action stay-manchester-d3-d4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count d3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count d3)) (M-stay-count d4))
    )
    (:action stay-manchester-d4-d5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count d4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count d4)) (M-stay-count d5))
    )
    (:action stay-manchester-d5-d6
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count d5) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count d5)) (M-stay-count d6))
    )
    (:action stay-manchester-d6-d7
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count d6) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count d6)) (M-stay-count d7))
    )

    ; --- Bucharest Stay Actions (B=5 required) ---
    ; Only allowed before the critical Lyon window
    (:action stay-bucharest-d0-d1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count d0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count d0)) (B-stay-count d1))
    )
    (:action stay-bucharest-d1-d2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count d1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count d1)) (B-stay-count d2))
    )
    (:action stay-bucharest-d2-d3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count d2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count d2)) (B-stay-count d3))
    )
    (:action stay-bucharest-d3-d4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count d3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count d3)) (B-stay-count d4))
    )
    (:action stay-bucharest-d4-d5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count d4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count d4)) (B-stay-count d5))
    )

    ; --- Lyon Stay Actions (L=5 required, must occur during critical T12-T16 transitions) ---

    ; N=0 (d0->d1):
    (:action stay-lyon-d0-d1-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d0) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d0)) (L-stay-count d1) (relatives-visited))
    )
    (:action stay-lyon-d0-d1-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d0) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d0)) (L-stay-count d1))
    )

    ; N=1 (d1->d2):
    (:action stay-lyon-d1-d2-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d1) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d1)) (L-stay-count d2) (relatives-visited))
    )
    (:action stay-lyon-d1-d2-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d1) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d1)) (L-stay-count d2))
    )

    ; N=2 (d2->d3):
    (:action stay-lyon-d2-d3-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d2) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d2)) (L-stay-count d3) (relatives-visited))
    )
    (:action stay-lyon-d2-d3-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d2) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d2)) (L-stay-count d3))
    )

    ; N=3 (d3->d4):
    (:action stay-lyon-d3-d4-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d3) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d3)) (L-stay-count d4) (relatives-visited))
    )
    (:action stay-lyon-d3-d4-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d3) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d3)) (L-stay-count d4))
    )

    ; N=4 (d4->d5): Final stay count
    (:action stay-lyon-d4-d5-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d4) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d4)) (L-stay-count d5) (relatives-visited))
    )
    (:action stay-lyon-d4-d5-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count d4) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count d4)) (L-stay-count d5))
    )
)