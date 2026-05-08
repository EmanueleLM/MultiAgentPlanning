(define (problem trip_planning_17_days)
    (:domain integrated_trip_planning)
    (:objects
        lyon bucharest manchester - city
    )

    (:init
        ; Connectivity
        (direct-flight manchester bucharest)
        (direct-flight bucharest manchester)
        (direct-flight bucharest lyon)
        (direct-flight lyon bucharest)

        ; Initial State
        (at manchester)
        (visited manchester) 
        (not (visited lyon))
        (not (visited bucharest))
        (not (relatives-visited))

        ; Initial Fluents (Day 0)
        (= (total-trip-time) 0)
        (= (stay-lyon) 0)
        (= (stay-bucharest) 0)
        (= (stay-manchester) 0)
    )

    (:goal
        (and
            ; 1. Total trip time must be 17 days exactly
            (= (total-trip-time) 17)
            
            ; 2. All required cities must be visited
            (visited lyon)
            (visited bucharest)
            
            ; 3. Relatives visit must have occurred
            (relatives-visited)
            
            ; 4. Required minimum stays (Adjusted constraints: total stay time = 15 days, 5 days minimum each)
            (>= (stay-lyon) 5)
            (>= (stay-bucharest) 5) 
            (>= (stay-manchester) 5)
        )
    )
)