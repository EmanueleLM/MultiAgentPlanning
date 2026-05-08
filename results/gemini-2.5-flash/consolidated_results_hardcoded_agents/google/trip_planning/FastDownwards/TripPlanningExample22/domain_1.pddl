(define (domain trip-planning-orchestrator)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types city)

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
    )

    (:functions
        (days-in-frankfurt)
        (days-in-bucharest)
        (days-in-berlin-show) 
        (current-day-number) 
        (total-cost)
    )

    ; Action: Travel (takes 1 day)
    (:action travel
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (< (current-day-number) 12) ; Must occur on or before Day 11
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (increase (current-day-number) 1)
            (increase (total-cost) 1)
        )
    )

    ; Action: Stay in Frankfurt (takes 1 day)
    (:action stay_frankfurt
        :parameters ()
        :precondition (and 
            (at frankfurt) 
            (< (current-day-number) 12)
        )
        :effect (and
            (increase (current-day-number) 1)
            (increase (days-in-frankfurt) 1)
            (increase (total-cost) 1)
        )
    )

    ; Action: Stay in Bucharest (takes 1 day)
    (:action stay_bucharest
        :parameters ()
        :precondition (and 
            (at bucharest) 
            (< (current-day-number) 12)
        )
        :effect (and
            (increase (current-day-number) 1)
            (increase (days-in-bucharest) 1)
            (increase (total-cost) 1)
        )
    )
    
    ; Action: Stay in Berlin during show window (D1-D7)
    (:action stay_berlin_show_window
        :parameters ()
        :precondition (and 
            (at berlin) 
            (<= (current-day-number) 7) ; Current day 1 to 7
        )
        :effect (and
            (increase (current-day-number) 1)
            (increase (days-in-berlin-show) 1)
            (increase (total-cost) 1)
        )
    )
    
    ; Action: Stay in Berlin after show window (D8-D11)
    (:action stay_berlin_post_show
        :parameters ()
        :precondition (and 
            (at berlin) 
            (> (current-day-number) 7) ; Current day 8 to 11
            (< (current-day-number) 12) 
        )
        :effect (and
            (increase (current-day-number) 1)
            (increase (total-cost) 1)
        )
    )
)