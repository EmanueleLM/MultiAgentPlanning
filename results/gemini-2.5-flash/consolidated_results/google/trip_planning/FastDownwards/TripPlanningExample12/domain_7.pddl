(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types city)

    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        (visited ?c - city)
        (deficit-calculated)
        (tallinn-met)      ; Marker for meeting requirement (Day 9-15)
    )

    (:functions
        (total-time)
        (total-cost)
        (duration ?c - city) ; Actual duration spent in city
        (max-v) ; Deficit tracker for Valencia (5 initial)
        (max-a) ; Deficit tracker for Amsterdam (5 initial)
        (max-t) ; Deficit tracker for Tallinn (7 initial)
        (TIME-LIMIT) ; Hard limit (15 days)
    )

    ;; --- 1. Travel Actions (1 day cost) ---
    
    (:action travel-to-city
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (not (= ?to home)) 
            (< (total-time) (TIME-LIMIT)) 
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (increase (total-time) 1)
            (visited ?to)
        )
    )

    (:action travel-home
        :parameters (?from - city)
        :precondition (and
            (at ?from)
            (connected ?from home)
            (< (total-time) (TIME-LIMIT)) 
            (visited valencia) 
            (visited amsterdam) 
            (visited tallinn) 
            (tallinn-met) 
            (deficit-calculated)
        )
        :effect (and
            (not (at ?from))
            (at home)
            (increase (total-time) 1)
        )
    )


    ;; --- 2. Stay Actions (1 day cost) ---
    
    ; Valencia Stays (V=5 target)
    (:action stay-valencia-preferred
        :precondition (and 
            (at valencia) 
            (< (total-time) (- (TIME-LIMIT) 1)) ; Must reserve 1 day for travel home
            (> (max-v) 0)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (duration valencia) 1)
            (decrease (max-v) 1)
        )
    )
    (:action stay-valencia-optional
        :precondition (and 
            (at valencia) 
            (< (total-time) (- (TIME-LIMIT) 1)) ; Must reserve 1 day for travel home
            (= (max-v) 0)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (duration valencia) 1)
        )
    )

    ; Amsterdam Stays (A=5 target)
    (:action stay-amsterdam-preferred
        :precondition (and 
            (at amsterdam) 
            (< (total-time) (- (TIME-LIMIT) 1)) ; Must reserve 1 day for travel home
            (> (max-a) 0)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (duration amsterdam) 1)
            (decrease (max-a) 1)
        )
    )
    (:action stay-amsterdam-optional
        :precondition (and 
            (at amsterdam) 
            (< (total-time) (- (TIME-LIMIT) 1)) ; Must reserve 1 day for travel home
            (= (max-a) 0)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (duration amsterdam) 1)
        )
    )

    ; Tallinn Stays (T=7 target). Meeting window: Day 9 (T=8 before action) to Day 15 (T=14 before action).
    
    (:action stay-tallinn-pre-meeting-preferred
        :precondition (and 
            (at tallinn) 
            (< (total-time) 8) ; Before Day 9
            (> (max-t) 0)
            (< (total-time) (- (TIME-LIMIT) 1)) ; Must reserve 1 day for travel home
        )
        :effect (and
            (increase (total-time) 1)
            (increase (duration tallinn) 1)
            (decrease (max-t) 1)
        )
    )
    
    (:action stay-tallinn-meeting-window-preferred
        :precondition (and 
            (at tallinn) 
            (>= (total-time) 8) ; Day 9 or later
            (< (total-time) (- (TIME-LIMIT) 1)) ; Allows stay up to T=13 (ends T=14, Day 15)
            (> (max-t) 0)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (duration tallinn) 1)
            (decrease (max-t) 1)
            (tallinn-met) ; Hard Constraint satisfied
        )
    )
    
    ;; 3. Finalization Action: Calculates the cost (deviation)

    (:action calculate-deficit
        :precondition (and 
            (visited valencia)
            (visited amsterdam)
            (visited tallinn)
            (tallinn-met)
            (not (deficit-calculated))
            (not (at home)) 
            (< (total-time) (TIME-LIMIT)) 
        )
        :effect (and
            ; Cost calculation: Penalize remaining deficits (total unmet days)
            (increase (total-cost) (max-v))
            (increase (total-cost) (max-a))
            (increase (total-cost) (max-t))
            (deficit-calculated)
        )
    )
)