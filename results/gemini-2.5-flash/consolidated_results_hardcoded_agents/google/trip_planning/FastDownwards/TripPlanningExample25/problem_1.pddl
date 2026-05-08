(define (problem TripPlanningP25)
    (:domain TripPlanning)
    (:objects
        V L S - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 D15 D16 - day
    )
    
    (:init
        ; Connectivity
        (connected L S) (connected S L)
        (connected V L) (connected L V)
        
        ; Day Sequence (15 transitions cover 16 days)
        (is-next D1 D2) (is-next D2 D3) (is-next D3 D4) (is-next D4 D5)
        (is-next D5 D6) (is-next D6 D7) (is-next D7 D8) (is-next D8 D9)
        (is-next D9 D10) (is-next D10 D11) (is-next D11 D12) (is-next D12 D13)
        (is-next D13 D14) (is-next D14 D15) (is-next D15 D16)
        
        ; Mandatory Split Constraint D10 to D16
        (must-be-in-split D10)
        (must-be-in-split D11)
        (must-be-in-split D12)
        (must-be-in-split D13)
        (must-be-in-split D14)
        (must-be-in-split D15)
        (must-be-in-split D16)
        
        ; Initial State: Start at V on Day 1. Day 1 is already counted as spent.
        (is-current-day D1)
        (at V)
        
        ; Initial Fluents (Day 1 accounted for)
        (= (days-V) 1)
        (= (days-L) 0)
        (= (days-S) 0)
        (= (total-trip-days) 1)
        (= (total-cost) 0)
    )
    
    (:goal (and
        (is-current-day D16) 
        (= (total-trip-days) 16) 
        ; Required duration goals (V=4, L=5, S=7)
        (= (days-V) 4)
        (= (days-L) 5)
        (= (days-S) 7)
    ))
    
    (:metric minimize (total-cost))
)