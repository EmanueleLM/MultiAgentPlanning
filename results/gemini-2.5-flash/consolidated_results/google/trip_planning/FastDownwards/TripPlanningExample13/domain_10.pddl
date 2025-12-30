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
    (:action stay-manchester-count0-count1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count count0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count count0)) (M-stay-count count1))
    )
    (:action stay-manchester-count1-count2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count count1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count count1)) (M-stay-count count2))
    )
    (:action stay-manchester-count2-count3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count count2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count count2)) (M-stay-count count3))
    )
    (:action stay-manchester-count3-count4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count count3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count count3)) (M-stay-count count4))
    )
    (:action stay-manchester-count4-count5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count count4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count count4)) (M-stay-count count5))
    )
    (:action stay-manchester-count5-count6
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count count5) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count count5)) (M-stay-count count6))
    )
    (:action stay-manchester-count6-count7
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at manchester) (at-time ?t_curr) (next-time ?t_curr ?t_next) (M-stay-count count6) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (M-stay-count count6)) (M-stay-count count7))
    )

    ; --- Bucharest Stay Actions (B=5 required) ---
    (:action stay-bucharest-count0-count1
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count count0) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count count0)) (B-stay-count count1))
    )
    (:action stay-bucharest-count1-count2
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count count1) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count count1)) (B-stay-count count2))
    )
    (:action stay-bucharest-count2-count3
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count count2) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count count2)) (B-stay-count count3))
    )
    (:action stay-bucharest-count3-count4
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count count3) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count count3)) (B-stay-count count4))
    )
    (:action stay-bucharest-count4-count5
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at bucharest) (at-time ?t_curr) (next-time ?t_curr ?t_next) (B-stay-count count4) (not (must-be-in-lyon ?t_curr)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (B-stay-count count4)) (B-stay-count count5))
    )

    ; --- Lyon Stay Actions (L=5 required, must occur during critical T12-T16 transitions) ---

    ; N=0 (count0->count1):
    (:action stay-lyon-count0-count1-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count0) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count0)) (L-stay-count count1) (relatives-visited))
    )
    (:action stay-lyon-count0-count1-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count0) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count0)) (L-stay-count count1))
    )

    ; N=1 (count1->count2):
    (:action stay-lyon-count1-count2-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count1) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count1)) (L-stay-count count2) (relatives-visited))
    )
    (:action stay-lyon-count1-count2-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count1) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count1)) (L-stay-count count2))
    )

    ; N=2 (count2->count3):
    (:action stay-lyon-count2-count3-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count2) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count2)) (L-stay-count count3) (relatives-visited))
    )
    (:action stay-lyon-count2-count3-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count2) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count2)) (L-stay-count count3))
    )

    ; N=3 (count3->count4):
    (:action stay-lyon-count3-count4-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count3) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count3)) (L-stay-count count4) (relatives-visited))
    )
    (:action stay-lyon-count3-count4-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count3) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count3)) (L-stay-count count4))
    )

    ; N=4 (count4->count5): Final stay count
    (:action stay-lyon-count4-count5-visit
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count4) (must-be-in-lyon ?t_curr) (not (relatives-visited)))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count4)) (L-stay-count count5) (relatives-visited))
    )
    (:action stay-lyon-count4-count5-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and (at lyon) (at-time ?t_curr) (next-time ?t_curr ?t_next) (L-stay-count count4) (must-be-in-lyon ?t_curr) (relatives-visited))
        :effect (and (not (at-time ?t_curr)) (at-time ?t_next) (not (L-stay-count count4)) (L-stay-count count5))
    )
)