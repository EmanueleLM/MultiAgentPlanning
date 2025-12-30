(define (problem TripPlanningExample4)
    (:domain TripPlanning)
    (:objects
        seville munich tallinn - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 - day_counter
        C0 C1 C2 C3 C4 C5 C6 - count
    )

    (:init
        ; Initial location and start day
        (at seville)
        (current_day D1)

        ; Connectivity (Direct flights only)
        (connected seville munich)
        (connected munich seville)
        (connected munich tallinn)
        (connected tallinn munich)

        ; Initial Counts 
        (stayed_N_days seville C0)
        (stayed_N_days munich C0)
        (stayed_N_days tallinn C0)
        
        (= (total-cost) 0)
    )

    (:goal (and
        (current_day D13) ; Total trip duration is 12 days (D1 to D12)
        (required_days_met seville) ; 6 days spent
        (required_days_met munich) ; 4 days spent
        (required_days_met tallinn) ; 2 days spent
        (tallinn_day_11) ; Temporal constraint met (Tallinn must include D11)
        (tallinn_day_12) ; Temporal constraint met (Tallinn must include D12)
    ))
    
    (:metric minimize (total-cost))
)