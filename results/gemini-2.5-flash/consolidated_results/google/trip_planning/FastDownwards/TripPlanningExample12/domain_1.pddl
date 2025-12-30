(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city)

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        (visited ?c - city)
        (deficit-reported) ; Marker to ensure cost calculation happens before returning home
        (tallinn-met)      ; Marker for temporal constraint satisfaction (Day 9-15 in Tallinn)
    )

    (:functions
        (total-time)
        (total-cost)
        (duration ?c - city) ; Actual duration spent in city
        (max-v) ; Remaining desired duration for Valencia (5 initial)
        (max-a) ; Remaining desired duration for Amsterdam (5 initial)
        (max-t) ; Remaining desired duration for Tallinn (7 initial)
    )

    ;; 1. Travel Actions (1 day cost to total-time)

    (:action start-trip
        :parameters (?to - city)
        :precondition (and
            (at home)
            (connected home ?to)
            (not (= ?to home))
            (< (total-time) 15)
        )
        :effect (and
            (not (at home))
            (at ?to)
            (increase (total-time) 1)
            (visited ?to)
        )
    )

    (:action travel-city-to-city
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (not (= ?from home))
            (not (= ?to home))
            (< (total-time) 15)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (increase (total-time) 1)
            (visited ?to)
        )
    )

    (:action return-home
        :parameters (?from - city)
        :precondition (and
            (at ?from)
            (connected ?from home)
            (visited valencia)
            (visited amsterdam)
            (visited tallinn)
            (tallinn-met)      ; Hard Constraint: Meeting must be met
            (deficit-reported) ; Optimization metric must be calculated
            (< (total-time) 15)
        )
        :effect (and
            (not (at ?from))
            (at home)
            (increase (total-time) 1)
        )
    )
    
    ;; 2. Stay Actions (1 day cost to total-time, reduce duration deficit)

    (:action stay-valencia
        :precondition (and (at valencia) (< (total-time) 15))
        :effect (and
            (increase (total-time) 1)
            (increase (duration valencia) 1)
            ; Reduce deficit (max-v starts at 5)
            (when (> (max-v) 0) (decrease (max-v) 1))
        )
    )

    (:action stay-amsterdam
        :precondition (and (at amsterdam) (< (total-time) 15))
        :effect (and
            (increase (total-time) 1)
            (increase (duration amsterdam) 1)
            ; Reduce deficit (max-a starts at 5)
            (when (> (max-a) 0) (decrease (max-a) 1))
        )
    )

    (:action stay-tallinn
        :precondition (and (at tallinn) (< (total-time) 15))
        :effect (and
            (increase (total-time) 1)
            (increase (duration tallinn) 1)
            ; Reduce deficit (max-t starts at 7)
            (when (> (max-t) 0) (decrease (max-t) 1))
            
            ; Temporal Constraint Check: Stay must overlap with Day 9 or later.
            ; Day 9 starts when total-time >= 8 (before action execution).
            (when (>= (total-time) 8) (tallinn-met)) 
        )
    )

    ;; 3. Finalization Action: Calculates the cost (deviation)

    (:action report-deficit
        :precondition (and 
            (visited valencia)
            (visited amsterdam)
            (visited tallinn)
            (tallinn-met)
            (not (deficit-reported))
            (not (at home)) ; Must execute while still in a city before flying home
        )
        :effect (and
            ; Cost calculation: Penalize remaining deficits (total unmet days)
            (increase (total-cost) (max-v))
            (increase (total-cost) (max-a))
            (increase (total-cost) (max-t))
            (deficit-reported)
        )
    )
)