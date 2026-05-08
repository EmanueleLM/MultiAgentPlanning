(define (problem trip-planning-11-problem)
(:domain trip-planning-11)

; Objects are defined as constants in the domain.

(:init
    ; Connectivity (Symmetric)
    (connected VNN VLC)
    (connected VLC VNN)
    (connected VLS VNN)
    (connected VNN VLS)
    
    ; Day Stage Progression (15 days total)
    (is_successor Start D1)
    (is_successor D1 D2) (is_successor D2 D3) (is_successor D3 D4)
    (is_successor D4 D5) (is_successor D5 D6) (is_successor D6 D7)
    (is_successor D7 D8) (is_successor D8 D9) (is_successor D9 D10)
    (is_successor D10 D11) (is_successor D11 D12) (is_successor D12 D13)
    (is_successor D13 D14) (is_successor D14 D15)

    ; Duration progression
    (next_duration N0 N1) (next_duration N1 N2) (next_duration N2 N3)
    (next_duration N3 N4) (next_duration N4 N5) (next_duration N5 N6)
    (next_duration N6 N7) (next_duration N7 N8) (next_duration N8 N9)
    (next_duration N9 N10) (next_duration N10 N11) (next_duration N11 N12)
    (next_duration N12 N13) (next_duration N13 N14) (next_duration N14 N15)

    ; Initial State
    (current_stage Start)
    (VNN_count N0)
    (VLS_count N0)
    (VLC_count N0)
    
    ; Hard Temporal Constraints (Conference in Valencia on Day 9 and Day 15)
    (requires_VLC D9)
    (requires_VLC D15)
)

(:goal (and
    ; 1. Total duration must be exactly 15 days
    (current_stage D15)
    
    ; 2. Required stays must fit 15 days, prioritizing the 7 days in Valencia.
    ; Achievable distribution: VNN=4, VLS=4, VLC=7 (Total 15).
    (VNN_count N4)
    (VLS_count N4)
    (VLC_count N7)
))
)