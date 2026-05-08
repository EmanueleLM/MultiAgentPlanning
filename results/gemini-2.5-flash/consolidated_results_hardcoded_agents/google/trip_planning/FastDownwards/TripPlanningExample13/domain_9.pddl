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
    (:action stay-manchester-c0-c1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count c0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count c0)) (M-stay-count c1))
    )
    (:action stay-manchester-c1-c2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count c1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count c1)) (M-stay-count c2))
    )
    (:action stay-manchester-c2-c3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count c2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count c2)) (M-stay-count c3))
    )
    (:action stay-manchester-c3-c4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count c3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count c3)) (M-stay-count c4))
    )
    (:action stay-manchester-c4-c5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count c4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count c4)) (M-stay-count c5))
    )
    (:action stay-manchester-c5-c6
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count c5) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count c5)) (M-stay-count c6))
    )
    (:action stay-manchester-c6-c7
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count c6) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count c6)) (M-stay-count c7))
    )

    ; --- Bucharest Stay Actions (B=5 required) ---
    (:action stay-bucharest-c0-c1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count c0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count c0)) (B-stay-count c1))
    )
    (:action stay-bucharest-c1-c2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count c1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count c1)) (B-stay-count c2))
    )
    (:action stay-bucharest-c2-c3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count c2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count c2)) (B-stay-count c3))
    )
    (:action stay-bucharest-c3-c4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count c3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count c3)) (B-stay-count c4))
    )
    (:action stay-bucharest-c4-c5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count c4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count c4)) (B-stay-count c5))
    )

    ; --- Lyon Stay Actions (L=5 required, must occur during critical T12-T16 transitions) ---

    ; N=0 (c0->c1):
    (:action stay-lyon-c0-c1-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c0) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c0)) (L-stay-count c1) (relatives-visited))
    )
    (:action stay-lyon-c0-c1-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c0) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c0)) (L-stay-count c1))
    )

    ; N=1 (c1->c2):
    (:action stay-lyon-c1-c2-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c1) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c1)) (L-stay-count c2) (relatives-visited))
    )
    (:action stay-lyon-c1-c2-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c1) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c1)) (L-stay-count c2))
    )

    ; N=2 (c2->c3):
    (:action stay-lyon-c2-c3-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c2) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c2)) (L-stay-count c3) (relatives-visited))
    )
    (:action stay-lyon-c2-c3-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c2) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c2)) (L-stay-count c3))
    )

    ; N=3 (c3->c4):
    (:action stay-lyon-c3-c4-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c3) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c3)) (L-stay-count c4) (relatives-visited))
    )
    (:action stay-lyon-c3-c4-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c3) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c3)) (L-stay-count c4))
    )

    ; N=4 (c4->c5): Final stay count
    (:action stay-lyon-c4-c5-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c4) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c4)) (L-stay-count c5) (relatives-visited))
    )
    (:action stay-lyon-c4-c5-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count c4) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count c4)) (L-stay-count c5))
    )
)