(define (problem TripPlanningProblem)
    (:domain TripPlanningDomain)
    (:objects
        venice dubrovnik istanbul - city
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 - time_point ; 11 steps total
        d0 d1 d2 d3 d4 d5 d6 - day_count ; Sufficient for tracking up to 6 stay days
    )
    (:init
        ; Location and Visited
        (at dubrovnik)
        (visited dubrovnik)
        
        ; Time Initialization (11 total days allowed)
        (current_time t0)
        (next_time t0 t1) (next_time t1 t2) (next_time t2 t3) 
        (next_time t3 t4) (next_time t4 t5) (next_time t5 t6)
        (next_time t6 t7) (next_time t7 t8) (next_time t8 t9)
        (next_time t9 t10) (next_time t10 t11) 
        
        ; Day Count Initialization (d0 for all tracking)
        (current_venice_day d0)
        (current_dubrovnik_day d0)
        (current_istanbul_day d0)
        
        ; Venice Day Transitions (up to 6 required)
        (next_venice_day d0 d1) (next_venice_day d1 d2) (next_venice_day d2 d3)
        (next_venice_day d3 d4) (next_venice_day d4 d5) (next_venice_day d5 d6)
        
        ; Dubrovnik Day Transitions (up to 4 required)
        (next_dubrovnik_day d0 d1) (next_dubrovnik_day d1 d2) (next_dubrovnik_day d2 d3)
        (next_dubrovnik_day d3 d4)
        
        ; Istanbul Day Transitions (up to 3 required)
        (next_istanbul_day d0 d1) (next_istanbul_day d1 d2) (next_istanbul_day d2 d3)

        ; Connectivity
        (direct_flight dubrovnik istanbul)
        (direct_flight dubrovnik venice)
    )
    (:goal (and
        ; 1. Visit all cities (Unachievable due to connectivity)
        (visited venice)
        (visited istanbul)
        
        ; 2. Achieve maximum stay requirements (Unachievable due to time budget: 13 days needed)
        (current_venice_day d6)
        (current_dubrovnik_day d4)
        (current_istanbul_day d3)
        
        ; 3. Total duration limit must be 11 steps
        (current_time t11)
    ))
)