(define (problem TripPlanningExample2-Feasible)
    (:domain TripPlanningExample2)
    (:objects
        person - traveler
        reykjavik vienna venice - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 - day
        
        ; Required: R(2), V(7), E(4). Total 13 days. Trip duration: 11 days.
        ; Max feasible stay slots: 9 (11 days - 2 travel days).
        ; Prioritizing E(4) and R(2). Remaining V(3). Total 9 slots modeled.
        R1 R2 - duration-slot
        V1 V2 V3 - duration-slot
        E1 E2 E3 E4 - duration-slot
    )
    (:init
        (at person reykjavik) ; Starting location assumed
        (current-day D1)

        ; Day progression chain (10 transitions, 11 days total)
        (next-day D1 D2) (next-day D2 D3) (next-day D3 D4) 
        (next-day D4 D5) (next-day D5 D6) (next-day D6 D7) 
        (next-day D7 D8) (next-day D8 D9) (next-day D9 D10) 
        (next-day D10 D11)

        ; Direct Flights
        (direct-flight reykjavik vienna)
        (direct-flight vienna reykjavik)
        (direct-flight vienna venice)
        (direct-flight venice vienna)

        ; Duration Slots available (9 total)
        (slot-available R1) (slot-available R2)
        (slot-available V1) (slot-available V2) (slot-available V3) 
        (slot-available E1) (slot-available E2) (slot-available E3) (slot-available E4)
        
        ; Slot mapping
        (slot-of R1 reykjavik) (slot-of R2 reykjavik)
        (slot-of V1 vienna) (slot-of V2 vienna) (slot-of V3 vienna) 
        (slot-of E1 venice) (slot-of E2 venice) (slot-of E3 venice) (slot-of E4 venice)

        ; Mandatory Temporal Constraints (Wedding D8-D11)
        (wedding-day-required D8)
        (wedding-day-required D9)
        (wedding-day-required D10)
        (wedding-day-required D11)
    )
    (:goal (and
        ; 1. All 9 required/feasible duration slots must be consumed
        (not (slot-available R1)) (not (slot-available R2))
        (not (slot-available V1)) (not (slot-available V2)) (not (slot-available V3))
        (not (slot-available E1)) (not (slot-available E2)) (not (slot-available E3)) (not (slot-available E4))
        
        ; 2. Wedding must be fulfilled (D8-D11 location constraint)
        (wedding-day-fulfilled D8)
        (wedding-day-fulfilled D9)
        (wedding-day-fulfilled D10)
        (wedding-day-fulfilled D11)
        
        ; 3. Trip time horizon satisfied
        (not (current-day D11))
    ))