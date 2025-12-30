(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city)
    (:constants home - city)

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        (visited ?c - city)
        (deficit-reported)
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
            (< (total-time) 15) ; Allows travel up to t=14, setting t=15
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
            (< (total-time) 15) ; Must execute before t=15
        )
        :effect (and
            (not (at ?from))
            (at home)
            (increase (total-time) 1)
        )
    )
    
    ;; 2. Stay Actions (1 day cost to total-time, split to avoid conditional effects)

    ;; Valencia Stays
    (:action stay-valencia-preferred
        :precondition (and (at valencia) (< (total-time) 15) (> (max-v) 0))
        :effect (and
            (increase (total-time) 1)
            (increase (duration valencia) 1)
            (decrease (max-v) 1)
        )
    )
    (:action stay-valencia-optional
        :precondition (and (at valencia) (< (total-time) 15) (= (max-v) 0))
        :effect (and
            (increase (total-time) 1)
            (increase (duration valencia) 1)
        )
    )

    ;; Amsterdam Stays
    (:action stay-amsterdam-preferred
        :precondition (and (at amsterdam) (< (total-time) 15) (> (max-a) 0))
        :effect (and
            (increase (total-time) 1)
            (increase (duration amsterdam) 1)
            (decrease (max-a) 1)
        )
    )
    (:action stay-amsterdam-optional
        :precondition (and (at amsterdam) (< (total-time) 15) (= (max-a) 0))
        :effect (and
            (increase (total-time) 1)
            (increase (duration amsterdam) 1)
        )
    )

    ;; Tallinn Stays (Split based on deficit and time to set tallinn-met)

    (:action stay-tallinn-early-preferred
        :precondition (and (at tallinn) (< (total-time) 15) (< (total-time) 8) (> (max-t) 0))
        :effect (and
            (increase (total-time) 1)
            (increase (duration tallinn) 1)
            (decrease (max-t) 1)
        )
    )
    
    (:action stay-tallinn-early-optional
        :precondition (and (at tallinn) (< (total-time) 15) (< (total-time) 8) (= (max-t) 0))
        :effect (and
            (increase (total-time) 1)
            (increase (duration tallinn) 1)
        )
    )

    (:action stay-tallinn-late-preferred
        :precondition (and (at tallinn) (< (total-time) 15) (>= (total-time) 8) (> (max-t) 0))
        :effect (and
            (increase (total-time) 1)
            (increase (duration tallinn) 1)
            (decrease (max-t) 1)
            (tallinn-met) ; Set flag since day 9 or later (t>=8)
        )
    )

    (:action stay-tallinn-late-optional
        :precondition (and (at tallinn) (< (total-time) 15) (>= (total-time) 8) (= (max-t) 0))
        :effect (and
            (increase (total-time) 1)
            (increase (duration tallinn) 1)
            (tallinn-met) ; Set flag since day 9 or later (t>=8)
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
            (not (at home))
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