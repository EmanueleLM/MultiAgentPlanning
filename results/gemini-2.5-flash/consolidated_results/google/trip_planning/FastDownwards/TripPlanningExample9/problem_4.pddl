(define (problem trip-planning-p9)
    (:domain trip-planning-9)
    (:objects
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    )
    (:init
        ; Initial Location
        (at frankfurt) 
        
        ; Connectivity
        (connected bucharest frankfurt)
        (connected frankfurt bucharest)
        (connected frankfurt stuttgart)
        (connected stuttgart frankfurt)

        ; Time Setup
        (is-day d1)
        
        ; Day sequence
        (next-day d1 d2) (next-day d2 d3) (next-day d3 d4) 
        (next-day d4 d5) (next-day d5 d6) (next-day d6 d7) 
        (next-day d7 d8) (next-day d8 d9) (next-day d9 d10) 
        
        ; Day Classification for constraints (Workshop D5-D10 requires stay location S for D4 through D9)
        (pre-workshop-day d1)
        (pre-workshop-day d2)
        (pre-workshop-day d3)
        
        (workshop-start-day d4)
        
        (workshop-mandatory-stay-day d5) 
        (workshop-mandatory-stay-day d6) 
        (workshop-mandatory-stay-day d7) 
        (workshop-mandatory-stay-day d8) 
        (workshop-mandatory-stay-day d9) 
        
        (final-day d10)

        ; Initial cost
        (= (total-cost) 0)
    )
    (:goal
        (and
            (is-day d10)
            (at stuttgart)
        )
    )
    
    (:metric minimize (total-cost))
)