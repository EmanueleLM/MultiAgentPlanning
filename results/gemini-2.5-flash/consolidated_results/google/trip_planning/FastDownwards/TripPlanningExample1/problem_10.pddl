(define (problem trip-planning-p1)
    (:domain trip-planning)
    (:objects
        riga manchester split - city
        
        D0 D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 D15 - duration
        
        ; Riga duration counters (0 to 7)
        D0_R D1_R D2_R D3_R D4_R D5_R D6_R D7_R - duration
        ; Manchester duration counters (0 to 4)
        D0_M D1_M D2_M D3_M D4_M - duration
        ; Split duration counters (0 to 6)
        D0_S D1_S D2_S D3_S D4_S D5_S D6_S - duration
    )
    (:init
        ; Initial location: Start at Riga 
        (at riga)
        (visited riga) 

        ; --- Total Time Initialization (Starts at 0, goes up to 15) ---
        (total-time-is D0)
        (next-total D0 D1) (next-total D1 D2) (next-total D2 D3) (next-total D3 D4)
        (next-total D4 D5) (next-total D5 D6) (next-total D6 D7) (next-total D7 D8)
        (next-total D8 D9) (next-total D9 D10) (next-total D10 D11) (next-total D11 D12)
        (next-total D12 D13) (next-total D13 D14) (next-total D14 D15)

        ; --- City Time Initialization (Starts at 0) ---
        
        ; RIGA (Req: 7 days)
        (riga-time-is D0_R)
        (next-riga D0_R D1_R) (next-riga D1_R D2_R) (next-riga D2_R D3_R) 
        (next-riga D3_R D4_R) (next-riga D4_R D5_R) (next-riga D5_R D6_R) 
        (next-riga D6_R D7_R) 
        
        ; MANCHESTER (Req: 4 days)
        (manchester-time-is D0_M)
        (next-manchester D0_M D1_M) (next-manchester D1_M D2_M) 
        (next-manchester D2_M D3_M) (next-manchester D3_M D4_M)

        ; SPLIT (Req: 6 days)
        (split-time-is D0_S)
        (next-split D0_S D1_S) (next-split D1_S D2_S) (next-split D2_S D3_S) 
        (next-split D3_S D4_S) (next-split D4_S D5_S) (next-split D5_S D6_S) 
        
        ; Connectivity: Riga <-> Manchester, Manchester -> Split
        (direct-flight riga manchester)
        (direct-flight manchester riga)
        (direct-flight manchester split)
    )
    
    (:goal (and
        (total-time-is D15) ; Hard constraint: Total duration must be exactly 15 days
        (visited riga)
        (visited manchester)
        (visited split)
        ; Since optimization is based on maximizing utility (17 required, 15 available),
        ; the solution must naturally utilize 15 days of 'spend_day' actions.
    ))
)