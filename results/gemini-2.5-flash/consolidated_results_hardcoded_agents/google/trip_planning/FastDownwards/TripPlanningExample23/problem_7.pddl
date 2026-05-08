(define (problem tripplanningexample23)
    (:domain trip-planning)
    (:objects
        d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
        c0 c1 c2 c3 c4 - count
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
        (next-count c0 c1) (next-count c1 c2) 
        (next-count c2 c3) (next-count c3 c4)

        ; Initial State 
        (current-day d1)
        (at BUCHAREST) 
        (count-L c0) (count-B c0) (count-R c0)
        (= (total-cost) 0)
    )

    (:goal (and
        (current-day d9)
        (workshop-attended) 
        ; B(3) and R(4) achieved. R(4) is mandatory (D5-D8). B(3) is the maximum possible for B/L given B must facilitate D4 travel.
        (count-B c3) 
        (count-R c4) 
    ))
    
    (:metric minimize (total-cost))
)