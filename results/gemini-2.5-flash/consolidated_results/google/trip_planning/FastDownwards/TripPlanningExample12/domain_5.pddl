(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs :fluents)
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

    ;; --- 1. Travel Action (1 day cost) ---
    
    (:action travel
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            ; Travel must not exceed the time limit
            (< (total-time) (TIME-LIMIT)) 
            
            ; If traveling home, all mandatory goals must be met
            (or (not (= ?to home)) 
                (and 
                    (= ?to home) 
                    (visited valencia) 
                    (visited amsterdam) 
                    (visited tallinn) 
                    (tallinn-met) 
                    (deficit-calculated)
                )
            )
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (increase (total-time) 1)
            (when (not (= ?to home)) (visited ?to))
        )
    )

    ;; --- 2. Stay Actions (1 day cost) ---
    
    ; Stay actions are split into 'preferred' (reduces deficit) and 'optional' (increases duration past desired length).
    ; We enforce that optional stays cannot occur if they would prevent the final 1-day travel home.
    (define ?last-stay-time (- (TIME-LIMIT) 1))

    ; Valencia Stays (V=5 target)
    (:action stay-valencia-preferred
        :precondition (and 
            (at valencia) 
            (< (total-time) (TIME-LIMIT)) 
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
            (< (total-time) (- (TIME-LIMIT) 1)) ; Must reserve 1 day for travel
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
            (< (total-time) (TIME-LIMIT)) 
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
            (< (total-time) (- (TIME-LIMIT) 1)) 
            (= (max-a) 0)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (duration amsterdam) 1)
        )
    )

    ; Tallinn Stays (T=7 target). Meeting window: Day 9 (T=8 before action) to Day 15 (T=14 before action).
    ; Since we must travel home on T=14, stays are restricted to T < 14.
    
    (:action stay-tallinn-pre-meeting-preferred
        :precondition (and 
            (at tallinn) 
            (< (total-time) 8) ; Before Day 9
            (> (max-t) 0)
            (< (total-time) (TIME-LIMIT))
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
            (< (total-time) (- (TIME-LIMIT) 1)) ; Must finish stay before T=14, allowing travel at T=14
            (> (max-t) 0)
        )
        :effect (and
            (increase (total-time) 1)
            (increase (duration tallinn) 1)
            (decrease (max-t) 1)
            (tallinn-met) ; Hard Constraint satisfied
        )
    )
    
    ; We omit optional stays for Tallinn pre-meeting and meeting window, as the maximum time is highly constrained. 
    ; If required, the planner might use optional stays in A/V if they allow the required 4 stays in T to happen during the window.

    ;; 3. Finalization Action: Calculates the cost (deviation)

    (:action calculate-deficit
        :precondition (and 
            (visited valencia)
            (visited amsterdam)
            (visited tallinn)
            (tallinn-met)
            (not (deficit-calculated))
            (not (at home)) ; Must be calculated before returning home
            ; Ensure we have at least 1 travel day remaining
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