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
    (:action stay-manchester-s0-s1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count s0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count s0)) (M-stay-count s1))
    )
    (:action stay-manchester-s1-s2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count s1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count s1)) (M-stay-count s2))
    )
    (:action stay-manchester-s2-s3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count s2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count s2)) (M-stay-count s3))
    )
    (:action stay-manchester-s3-s4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count s3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count s3)) (M-stay-count s4))
    )
    (:action stay-manchester-s4-s5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count s4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count s4)) (M-stay-count s5))
    )
    (:action stay-manchester-s5-s6
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count s5) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count s5)) (M-stay-count s6))
    )
    (:action stay-manchester-s6-s7
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count s6) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count s6)) (M-stay-count s7))
    )

    ; --- Bucharest Stay Actions (B=5 required) ---
    ; Only allowed before the critical Lyon window
    (:action stay-bucharest-s0-s1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count s0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count s0)) (B-stay-count s1))
    )
    (:action stay-bucharest-s1-s2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count s1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count s1)) (B-stay-count s2))
    )
    (:action stay-bucharest-s2-s3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count s2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count s2)) (B-stay-count s3))
    )
    (:action stay-bucharest-s3-s4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count s3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count s3)) (B-stay-count s4))
    )
    (:action stay-bucharest-s4-s5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count s4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count s4)) (B-stay-count s5))
    )

    ; --- Lyon Stay Actions (L=5 required, must occur during critical T12-T16 transitions) ---

    ; N=0 (s0->s1):
    (:action stay-lyon-s0-s1-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s0) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s0)) (L-stay-count s1) (relatives-visited))
    )
    (:action stay-lyon-s0-s1-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s0) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s0)) (L-stay-count s1))
    )

    ; N=1 (s1->s2):
    (:action stay-lyon-s1-s2-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s1) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s1)) (L-stay-count s2) (relatives-visited))
    )
    (:action stay-lyon-s1-s2-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s1) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s1)) (L-stay-count s2))
    )

    ; N=2 (s2->s3):
    (:action stay-lyon-s2-s3-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s2) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s2)) (L-stay-count s3) (relatives-visited))
    )
    (:action stay-lyon-s2-s3-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s2) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s2)) (L-stay-count s3))
    )

    ; N=3 (s3->s4):
    (:action stay-lyon-s3-s4-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s3) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s3)) (L-stay-count s4) (relatives-visited))
    )
    (:action stay-lyon-s3-s4-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s3) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s3)) (L-stay-count s4))
    )

    ; N=4 (s4->s5): Final stay count
    (:action stay-lyon-s4-s5-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s4) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s4)) (L-stay-count s5) (relatives-visited))
    )
    (:action stay-lyon-s4-s5-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count s4) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count s4)) (L-stay-count s5))
    )
)