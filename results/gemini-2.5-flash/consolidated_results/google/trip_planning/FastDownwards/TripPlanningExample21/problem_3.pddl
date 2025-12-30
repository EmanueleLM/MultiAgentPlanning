(define (problem TripPlanningExample21)
    (:domain trip-planning)
    (:objects
    )

    (:init
        ; Time progression (10 days total)
        (current-time T0)
        (next-time T0 T1) (next-time T1 T2) (next-time T2 T3) (next-time T3 T4) 
        (next-time T4 T5) (next-time T5 T6) (next-time T6 T7) (next-time T7 T8) 
        (next-time T8 T9) (next-time T9 T10)

        ; Connectivity: M <-> W, W <-> V
        (is-connected mykonos vienna)
        (is-connected vienna mykonos)
        (is-connected vienna venice)
        (is-connected venice vienna)
        
        ; Initial State (Start in Mykonos, initial budget M=2, W=2, V=6)
        (at mykonos)
        (M-phase)
    )

    (:goal (and
        (current-time T10)
        (visited mykonos)
        (visited vienna)
        (visited venice)
        (M-duration-met)
        (W-duration-met)
        (V-duration-met)
    ))
)