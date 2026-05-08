(define (problem TripPlanningExample2-Feasible)
    (:domain TripPlanningExample2)
    (:objects
        person - traveler
        reykjavik vienna venice - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 - day
        
        ; Feasible duration slots (Total 9 stays in 11 days):
        R1 R2 - duration-slot ; Reykjavik (2 days)
        V1 V2 V3 - duration-slot ; Vienna (3 days, reduced from 7)
        E1 E2 E3 E4 - duration-slot ; Venice (4 days, mandatory D8-D11)
    )
    (:init
        (at person reykjavik) 
        (current-day D1)

        ; Day progression chain (D1 -> D11)
        (next-day D1 D2) (next-day D2 D3) (next-day D3 D4) 
        (next-day D4 D5) (next-day D5 D6) (next-day D6 D7) 
        (next-day D7 D8) (next-day D8 D9) (next-day D9 D10) 
        (next-day D10 D11)

        ; Direct Flights: R <-> V, V <-> E
        (direct-flight reykjavik vienna)
        (direct-flight vienna reykjavik)
        (direct-flight vienna venice)
        (direct-flight venice vienna)

        ; Duration Slots available
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
        ; 1. All feasible duration slots must be consumed (R=2, V=3, E=4)
        (not (slot-available R1)) (not (slot-available R2))
        (not (slot-available V1)) (not (slot-available V2)) (not (slot-available V3))
        (not (slot-available E1)) (not (slot-available E2)) (not (slot-available E3)) (not (slot-available E4))
        
        ; 2. Wedding must be fulfilled (D8-D11 location constraint satisfied)
        (wedding-day-fulfilled D8)
        (wedding-day-fulfilled D9)
        (wedding-day-fulfilled D10)
        (wedding-day-fulfilled D11)
        
        ; 3. Trip time horizon satisfied (Action taken on D11 terminates the clock)
        (not (current-day D11))
    ))
)