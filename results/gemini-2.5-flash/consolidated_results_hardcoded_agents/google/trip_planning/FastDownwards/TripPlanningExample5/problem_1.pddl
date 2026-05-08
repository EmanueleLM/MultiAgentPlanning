(define (problem TripPlanningExample5_P)
    (:domain TripPlanningExample5)
    (:init
        ; --- Connectivity (Bidirectional flights) ---
        (connection Oslo Dubrovnik)
        (connection Dubrovnik Oslo)
        (connection Porto Oslo)
        (connection Oslo Porto)

        ; --- Day Sequence (16 days trip D1 -> D17 transition) ---
        (current-day D1)
        (next-day D1 D2) (next-day D2 D3) (next-day D3 D4) (next-day D4 D5)
        (next-day D5 D6) (next-day D6 D7) (next-day D7 D8) (next-day D8 D9)
        (next-day D9 D10) (next-day D10 D11) (next-day D11 D12) (next-day D12 D13)
        (next-day D13 D14) (next-day D14 D15) (next-day D15 D16) (next-day D16 D17)

        ; --- Stay Count Sequence (S0 to S5 needed for goal: P5, O4, D5) ---
        (next-count S0 S1) (next-count S1 S2) (next-count S2 S3) (next-count S3 S4)
        (next-count S4 S5) (next-count S5 S6) (next-count S6 S7)

        ; --- Initial State ---
        (at Porto) ; Start location assumed for the optimal schedule path P->O->D
        (stay-count Oslo S0)
        (stay-count Porto S0)
        (stay-count Dubrovnik S0)

        ; --- Mandatory Conference Days in Dubrovnik ---
        (conference-day D12)
        (conference-day D16)
    )
    (:goal (and
        (current-day D17)
        ; Feasible maximized stays: Porto 5, Oslo 4, Dubrovnik 5. Total 14 stays.
        (stay-count Porto S5)
        (stay-count Oslo S4)
        (stay-count Dubrovnik S5)
    ))
)