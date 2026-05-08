(define (problem tripplanningexample23)
    (:domain trip-planning)
    (:objects
        d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
        C0 C1 C2 C3 C4 - count ; Fixed Casing
    )

    (:init
        ; Connectivity
        (direct-flight LONDON BUCHAREST)
        (direct-flight BUCHAREST LONDON)
        (direct-flight BUCHAREST RIGA)
        (direct-flight RIGA BUCHAREST)

        ; Day transitions
        (next-day d1 d2) (next-day d2 d3) (next-day d3 d4) 
        (next-day d4 d5) (next-day d5 d6) (next-day d6 d7) 
        (next-day d7 d8) (next-day d8 d9)
        
        ; Count transitions
        (next-count C0 C1) (next-count C1 C2) 
        (next-count C2 C3) (next-count C3 C4)

        ; Initial State 
        (current-day d1)
        (at BUCHAREST) 
        (count-L C0) (count-B C0) (count-R C0)
        (= (total-cost) 0)
    )

    (:goal (and
        (current-day d9)
        (workshop-attended) 
        ; Goal reflects achievable counts: B=3 and R=4 (L=0)
        (count-B C3) 
        (count-R C4) 
    ))
    
    (:metric minimize (total-cost))