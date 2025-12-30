(define (domain integrated_trip_planning)
    (:requirements :strips :typing :negative-preconditions)

    (:types city timepoint stay_count)

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
    (:action stay-manchester-S0-S1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count S0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count S0)) (M-stay-count S1))
    )
    (:action stay-manchester-S1-S2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count S1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count S1)) (M-stay-count S2))
    )
    (:action stay-manchester-S2-S3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count S2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count S2)) (M-stay-count S3))
    )
    (:action stay-manchester-S3-S4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count S3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count S3)) (M-stay-count S4))
    )
    (:action stay-manchester-S4-S5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count S4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count S4)) (M-stay-count S5))
    )
    (:action stay-manchester-S5-S6
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count S5) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count S5)) (M-stay-count S6))
    )
    (:action stay-manchester-S6-S7
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count S6) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count S6)) (M-stay-count S7))
    )

    ; --- Bucharest Stay Actions (B=5 required) ---
    ; Only allowed before the critical Lyon window
    (:action stay-bucharest-S0-S1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count S0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count S0)) (B-stay-count S1))
    )
    (:action stay-bucharest-S1-S2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count S1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count S1)) (B-stay-count S2))
    )
    (:action stay-bucharest-S2-S3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count S2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count S2)) (B-stay-count S3))
    )
    (:action stay-bucharest-S3-S4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count S3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count S3)) (B-stay-count S4))
    )
    (:action stay-bucharest-S4-S5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count S4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count S4)) (B-stay-count S5))
    )

    ; --- Lyon Stay Actions (L=5 required, must occur during critical T12-T16 transitions) ---
    ; Note: L stay actions require (must-be-in-lyon ?t_curr), ensuring they only run during the critical window.

    ; N=0 (S0->S1):
    (:action stay-lyon-S0-S1-VISIT
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S0) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S0)) (L-stay-count S1) (relatives-visited))
    )
    (:action stay-lyon-S0-S1-REGULAR
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S0) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S0)) (L-stay-count S1))
    )

    ; N=1 (S1->S2):
    (:action stay-lyon-S1-S2-VISIT
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S1) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S1)) (L-stay-count S2) (relatives-visited))
    )
    (:action stay-lyon-S1-S2-REGULAR
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S1) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S1)) (L-stay-count S2))
    )

    ; N=2 (S2->S3):
    (:action stay-lyon-S2-S3-VISIT
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S2) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S2)) (L-stay-count S3) (relatives-visited))
    )
    (:action stay-lyon-S2-S3-REGULAR
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S2) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S2)) (L-stay-count S3))
    )

    ; N=3 (S3->S4):
    (:action stay-lyon-S3-S4-VISIT
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S3) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S3)) (L-stay-count S4) (relatives-visited))
    )
    (:action stay-lyon-S3-S4-REGULAR
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S3) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S3)) (L-stay-count S4))
    )

    ; N=4 (S4->S5): Final stay count
    (:action stay-lyon-S4-S5-VISIT
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S4) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S4)) (L-stay-count S5) (relatives-visited))
    )
    (:action stay-lyon-S4-S5-REGULAR
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count S4) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count S4)) (L-stay-count S5))
    )
)