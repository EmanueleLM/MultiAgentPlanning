(define (problem trip-planning-8)
    (:domain trip-planning)
    
    (:init
        ; Connectivity
        (flight ZURICH KRAKOW)
        (flight KRAKOW ZURICH)
        (flight ATHENS ZURICH)
        (flight ZURICH ATHENS)
        
        ; Initial location (Must start at Athens to meet D1-D7 requirement for 7 days)
        (at ATHENS) 
        
        ; Time initialization
        (current-day D1)
        (= (total-cost) 0) 
        
        ; Day progression facts (D1 to D21)
        (next-day D1 D2) (next-day D2 D3) (next-day D3 D4) (next-day D4 D5)
        (next-day D5 D6) (next-day D6 D7) (next-day D7 D8) (next-day D8 D9)
        (next-day D9 D10) (next-day D10 D11) (next-day D11 D12) (next-day D12 D13)
        (next-day D13 D14) (next-day D14 D15) (next-day D15 D16) (next-day D16 D17)
        (next-day D17 D18) (next-day D18 D19) (next-day D19 D20) (next-day D20 D21)
        
        ; Progress initialization
        (stay-krakow-progress N0)
        (stay-athens-progress N0)
        (stay-zurich-progress N0)
        
        ; Count progression facts (N0 to N7)
        (next-count N0 N1) (next-count N1 N2) (next-count N2 N3) (next-count N3 N4)
        (next-count N4 N5) (next-count N5 N6) (next-count N6 N7)
    )
    
    ; Goal: Fulfill all required stays (6+7+5 = 18 actions total)
    (:goal (and
        (stay-krakow-progress N6)
        (stay-athens-progress N7)
        (stay-zurich-progress N5)
    ))
    
    (:metric minimize (total-cost))
)