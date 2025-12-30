(define (problem trip_planning_17_days)
    (:domain integrated_trip_planning)
    (:objects
        lyon bucharest manchester - city
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 T17 - timepoint
    )

    (:init
        ; Connectivity
        (direct-flight manchester bucharest)
        (direct-flight bucharest manchester)
        (direct-flight bucharest lyon)
        (direct-flight lyon bucharest)

        ; Time sequence definition (17 steps from T0 to T17)
        (at-time T0)
        (next-time T0 T1) (next-time T1 T2) (next-time T2 T3) (next-time T3 T4) 
        (next-time T4 T5) (next-time T5 T6) (next-time T6 T7) (next-time T7 T8)
        (next-time T8 T9) (next-time T9 T10) (next-time T10 T11) (next-time T11 T12)
        (next-time T12 T13) (next-time T13 T14) (next-time T14 T15) (next-time T15 T16)
        (next-time T16 T17)

        ; Lyon Critical Window: Must be in Lyon to advance time from T12 up to T16 (Days 13 through 17)
        (must-be-in-lyon T12)
        (must-be-in-lyon T13)
        (must-be-in-lyon T14)
        (must-be-in-lyon T15)
        (must-be-in-lyon T16)

        ; Initial Location (Starting in Manchester)
        (at manchester)
        (visited manchester) 

        ; Initial Fluents
        (= (stay-lyon) 0)
        (= (stay-bucharest) 0)
        (= (stay-manchester) 0)
    )

    (:goal
        (and
            ; 1. Total trip time is 17 days exactly
            (at-time T17)
            
            ; 2. All required cities must be visited
            (visited lyon)
            (visited bucharest)
            
            ; 3. Relatives visit must have occurred
            (relatives-visited)
            
            ; 4. Exact required stays based on the 17 day total budget: L=5, B=5, M=7
            (= (stay-lyon) 5)
            (= (stay-bucharest) 5) 
            (= (stay-manchester) 7)
        )
    )
)