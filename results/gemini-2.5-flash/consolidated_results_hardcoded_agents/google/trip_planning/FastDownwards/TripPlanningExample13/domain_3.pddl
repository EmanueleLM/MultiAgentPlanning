(define (domain integrated_trip_planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types city timepoint)

    (:predicates
        (at ?c - city)
        (direct-flight ?c1 ?c2 - city)
        (relatives-visited)
        (visited ?c - city)
        (at-time ?t - timepoint)
        (next-time ?t1 ?t2 - timepoint)
        (must-be-in-lyon ?t - timepoint) ; T12, T13, T14, T15, T16
    )

    (:functions
        (stay-lyon)
        (stay-bucharest)
        (stay-manchester)
    )
    
    ; 1. Instantaneous Travel Action: Travel does not consume a day.
    (:action fly
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (direct-flight ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
        )
    )

    ; 2. Stay actions for Days 1-12 (T0 to T11 transitions)
    ; These actions are forbidden during the critical Lyon window (T12 onwards)
    
    (:action stay-manchester
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and
            (at manchester)
            (at-time ?t_curr)
            (next-time ?t_curr ?t_next)
            (not (must-be-in-lyon ?t_curr))
        )
        :effect (and
            (not (at-time ?t_curr))
            (at-time ?t_next)
            (increase (stay-manchester) 1)
        )
    )
    
    (:action stay-bucharest
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and
            (at bucharest)
            (at-time ?t_curr)
            (next-time ?t_curr ?t_next)
            (not (must-be-in-lyon ?t_curr))
        )
        :effect (and
            (not (at-time ?t_curr))
            (at-time ?t_next)
            (increase (stay-bucharest) 1)
        )
    )

    ; 3. Stay actions for Critical Time (Days 13-17, T12 to T16 transitions)
    ; Only Lyon actions are possible during this time, enforcing contiguous occupancy.
    
    (:action stay-lyon-critical-regular
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and
            (at lyon)
            (at-time ?t_curr)
            (next-time ?t_curr ?t_next)
            (must-be-in-lyon ?t_curr)
        )
        :effect (and
            (not (at-time ?t_curr))
            (at-time ?t_next)
            (increase (stay-lyon) 1)
        )
    )

    (:action visit-relatives-critical
        :parameters (?t_curr ?t_next - timepoint)
        :precondition (and
            (at lyon)
            (at-time ?t_curr)
            (next-time ?t_curr ?t_next)
            (must-be-in-lyon ?t_curr) 
            (not (relatives-visited)) ; Can only happen once
        )
        :effect (and
            (not (at-time ?t_curr))
            (at-time ?t_next)
            (increase (stay-lyon) 1)
            (relatives-visited)
        )
    )
)