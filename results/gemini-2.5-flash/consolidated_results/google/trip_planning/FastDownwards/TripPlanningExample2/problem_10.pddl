(define (problem TripPlanningExample2-Feasible)
    (:domain TripPlanningExample2)
    (:objects
        person - traveler
        reykjavik vienna venice - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 - day ; D12 completes the 11th step (D11 -> D12)
        R1 R2 V1 V2 V3 E1 E2 E3 E4 - duration-slot ; Total 9 slots required (2 R, 3 V, 4 E)
    )
    (:init
        (at person reykjavik) 
        (current-day D1)

        ; Day progression chain (11 steps: D1 -> D12)
        (next-day D1 D2) (next-day D2 D3) (next-day D3 D4) 
        (next-day D4 D5) (next-day D5 D6) (next-day D6 D7) 
        (next-day D7 D8) (next-day D8 D9) (next-day D9 D10) 
        (next-day D10 D11) (next-day D11 D12)

        ; Direct Flights: R <-> V, V <-> E
        (direct-flight reykjavik vienna)
        (direct-flight vienna reykjavik)
        (direct-flight vienna venice)
        (direct-flight venice vienna)

        ; Duration Slots available (R=2, V=3, E=4 => Total 9 slots required)
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
        ; 1. All 9 required duration slots must be consumed
        (not (slot-available R1)) (not (slot-available R2))
        (not (slot-available V1)) (not (slot-available V2)) (not (slot-available V3))
        (not (slot-available E1)) (not (slot-available E2)) (not (slot-available E3)) (not (slot-available E4))
        
        ; 2. Wedding must be fulfilled (D8-D11 location constraint satisfied)
        (wedding-day-fulfilled D8)
        (wedding-day-fulfilled D9)
        (wedding-day-fulfilled D10)
        (wedding-day-fulfilled D11)
        
        ; 3. Trip time horizon satisfied (11 steps completed)
        (current-day D12)
    ))
)