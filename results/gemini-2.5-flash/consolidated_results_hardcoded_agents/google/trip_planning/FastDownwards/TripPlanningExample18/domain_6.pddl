(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)

    (:types
        city - object
        day - object
    )

    (:constants
        amsterdam vilnius bucharest - city
    )

    (:predicates
        (connected ?c1 - city ?c2 - city)
        (at ?c - city)
        (visited ?c - city)
        (meeting_achieved)
        
        (is-day ?d - day) 
        (next-day ?d1 - day ?d2 - day) 
        (meeting-time ?d - day) ; Marker for valid start days D5 through D10 (Meeting occurs D6 through D11)
    )
    
    (:functions 
        (total-cost) - number
    )
    
    ; Action 1: Travel (Consumes 1 day step)
    (:action travel
        :parameters (?from - city ?to - city ?d_start - day ?d_end - day)
        :precondition (and 
            (connected ?from ?to)
            (at ?from)
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (visited ?to)
            
            (not (is-day ?d_start))
            (is-day ?d_end)
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Stay (General) (Consumes 1 day step)
    (:action stay
        :parameters (?c - city ?d_start - day ?d_end - day)
        :precondition (and
            (at ?c)
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
        )
        :effect (and
            (not (is-day ?d_start))
            (is-day ?d_end)
            (increase (total-cost) 1)
        )
    )

    ; Action 3: Stay in Bucharest and Achieve Meeting (Consumes 1 day step)
    (:action stay_bucharest_meeting
        :parameters (?d_start - day ?d_end - day)
        :precondition (and
            (at bucharest)
            (not (meeting_achieved))
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
            (meeting-time ?d_start) ; Must start during the Day 6-11 window (D5, D6, ..., D10)
        )
        :effect (and
            (not (is-day ?d_start)) 
            (is-day ?d_end)
            (meeting_achieved)
            (increase (total-cost) 1)
        )
    )
)