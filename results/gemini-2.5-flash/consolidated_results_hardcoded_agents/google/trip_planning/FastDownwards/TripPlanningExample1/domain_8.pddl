(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types city - object)
    
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (direct-flight ?from - city ?to - city)
    )

    (:functions
        (total-time) ; Total trip duration (Target: 15)
        (time-spent-in ?c - city) ; Time spent in a specific city
        (required-duration ?c - city) ; Target duration for utility calculation
        (total-cost) ; Cost fluent to minimize (maximizing utility gain)
    )

    ;; Action 1: Travel between cities (0 time cost)
    (:action travel
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

    ;; Action 2: Spend 1 day in the current city
    (:action spend_day
        :parameters (?c - city)
        :precondition (and
            (at ?c)
            ; Hard constraint: Total duration must not exceed 15.
            (<= (total-time) 14)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (time-spent-in ?c) 1)
            
            ; Utility update: Decrease cost (increase utility) if time spent *before* this increment 
            ; was less than the required duration.
            (when (< (time-spent-in ?c) (required-duration ?c))
                (increase (total-cost) -1)
            )
        )
    )
)