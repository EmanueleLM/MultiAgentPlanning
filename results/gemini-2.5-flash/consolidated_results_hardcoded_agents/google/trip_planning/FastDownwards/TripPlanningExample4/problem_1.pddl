(define (problem TripPlanningExample4)
    (:domain TripPlanning)
    (:objects
        Seville Munich Tallinn - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 - day_counter
        C0 C1 C2 C3 C4 C5 C6 - count
    )

    (:init
        ; Initial location and start day
        (at Seville)
        (current_day D1)

        ; Connectivity (Direct flights only)
        (connected Seville Munich)
        (connected Munich Seville)
        (connected Munich Tallinn)
        (connected Tallinn Munich)

        ; Initial Counts 
        (stayed_N_days Seville C0)
        (stayed_N_days Munich C0)
        (stayed_N_days Tallinn C0)
    )

    (:goal (and
        (current_day D13) ; Total trip duration is 12 days (D1 to D12)
        (required_days_met Seville) ; 6 days spent
        (required_days_met Munich) ; 4 days spent
        (required_days_met Tallinn) ; 2 days spent
        (tallinn_day_11) ; Temporal constraint met
        (tallinn_day_12) ; Temporal constraint met
    ))
)