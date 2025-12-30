(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs :fluents)

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
        (meeting-time ?d - day) ; Marker for valid action start days D5 through D10
    )
    
    (:functions 
        (total-cost) - number ; Tracks trip duration (1 unit per day/step)
        (stayed-A) - number
        (stayed-V) - number
        (stayed-B) - number
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

    ; Action 2a: Stay in Amsterdam (Increments stayed-A)
    (:action stay_amsterdam
        :parameters (?d_start - day ?d_end - day)
        :precondition (and
            (at amsterdam)
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
        )
        :effect (and
            (increase (stayed-A) 1)
            (not (is-day ?d_start))
            (is-day ?d_end)
            (increase (total-cost) 1)
        )
    )

    ; Action 2b: Stay in Vilnius (Increments stayed-V)
    (:action stay_vilnius
        :parameters (?d_start - day ?d_end - day)
        :precondition (and
            (at vilnius)
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
        )
        :effect (and
            (increase (stayed-V) 1)
            (not (is-day ?d_start))
            (is-day ?d_end)
            (increase (total-cost) 1)
        )
    )

    ; Action 2c: Stay in Bucharest (Pre-meeting or outside meeting window)
    (:action stay_bucharest_pre_meeting
        :parameters (?d_start - day ?d_end - day)
        :precondition (and
            (at bucharest)
            (not (meeting_achieved)) 
            (not (meeting-time ?d_start)) ; Only allowed before Day 6
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
        )
        :effect (and
            (increase (stayed-B) 1)
            (not (is-day ?d_start))
            (is-day ?d_end)
            (increase (total-cost) 1)
        )
    )

    ; Action 3: Stay in Bucharest and Achieve Meeting (Must occur during Day 6-11 window)
    (:action stay_bucharest_meeting
        :parameters (?d_start - day ?d_end - day)
        :precondition (and
            (at bucharest)
            (not (meeting_achieved))
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
            (meeting-time ?d_start) ; D5 through D10
        )
        :effect (and
            (increase (stayed-B) 1) 
            (not (is-day ?d_start)) 
            (is-day ?d_end)
            (meeting_achieved)
            (increase (total-cost) 1)
        )
    )
    
    ; Action 4: Stay in Bucharest (Post-meeting)
    (:action stay_bucharest_post_meeting
        :parameters (?d_start - day ?d_end - day)
        :precondition (and
            (at bucharest)
            (meeting_achieved)
            (is-day ?d_start)
            (next-day ?d_start ?d_end)
        )
        :effect (and
            (increase (stayed-B) 1)
            (not (is-day ?d_start))
            (is-day ?d_end)
            (increase (total-cost) 1)
        )
    )
)