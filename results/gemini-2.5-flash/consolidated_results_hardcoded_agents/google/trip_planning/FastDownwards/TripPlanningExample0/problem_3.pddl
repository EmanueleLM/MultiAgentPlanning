(define (problem trip-example-0)
    (:domain trip-planning)
    (:objects
        F - city
        B - city
        H - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 - day
    )
    (:init
        ; Initial State: Start at H on Day 1.
        (at H) 
        (current_day D1)
        
        ; Day sequence D1 -> D14
        (next D1 D2) (next D2 D3) (next D3 D4) (next D4 D5) (next D5 D6)
        (next D6 D7) (next D7 D8) (next D8 D9) (next D9 D10) (next D10 D11)
        (next D11 D12) (next D12 D13) (next D13 D14)
        (last_day_of_trip D14)

        ; Connectivity
        (connected B F) (connected F B)
        (connected H B) (connected B H)

        ; Day type assignments based on optimized schedule H(D1), T1(D2), B(D3-D7), T2(D8), F(D9-D14)
        
        ; H Stay (1 day)
        (day_type_H D1)
        
        ; Travel 1 (1 day)
        (day_type_T1 D2)
        
        ; B Stay (5 days)
        (day_type_B D3) (day_type_B D4) (day_type_B D5) (day_type_B D6) (day_type_B D7)
        
        ; Travel 2 (1 day)
        (day_type_T2 D8)
        
        ; F Stay (6 days: D9 to D14) 
        (day_type_F D9) (day_type_F D10) (day_type_F D11) (day_type_F D12) (day_type_F D13) (day_type_F D14)

        ; Initial Phase State
        (on_schedule_phase_1_H)
    )
    (:goal (and
        (current_day D14)
        (at F) 
        (stay_in_H_complete)
        (stay_in_B_complete)
        (stay_in_F_complete)
    ))
)