(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :numeric-fluents :action-costs)
    (:types city - object)
    
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (direct-flight ?from - city ?to - city)
    )

    (:functions
        (total-time)
        (time-spent-in ?c - city)
        (required-duration ?c - city)
        (trip-cost)
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
            ; Hard constraint: Total duration must not exceed 15
            (< (total-time) 15)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (time-spent-in ?c) 1)
            
            ; Utility update: If the time spent before this action (S) is less than the required duration (R),
            ; we gain utility 1 (modeled as decreasing trip-cost by 1).
            (when (< (time-spent-in ?c) (required-duration ?c))
                (increase (trip-cost) -1)
            )
        )
    )
)