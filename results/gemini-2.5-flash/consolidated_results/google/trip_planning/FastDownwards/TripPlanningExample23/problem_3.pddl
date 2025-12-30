(define (problem tripplanningexample23)
    (:domain trip-planning)
    (:objects
        london bucharest riga - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
        c0 c1 c2 c3 c4 - count
    )

    (:init
        ; Connectivity
        (direct-flight london bucharest)
        (direct-flight bucharest london)
        (direct-flight bucharest riga)
        (direct-flight riga bucharest)

        ; Day transitions
        (next-day d1 d2) (next-day d2 d3) (next-day d3 d4) 
        (next-day d4 d5) (next-day d5 d6) (next-day d6 d7) 
        (next-day d7 d8) (next-day d8 d9)
        
        ; Count transitions
        (next-count c0 c1) (next-count c1 c2) 
        (next-count c2 c3) (next-count c3 c4)

        ; Initial State 
        (current-day d1)
        (at bucharest) 
        (count-L c0) (count-B c0) (count-R c0)
    )

    (:goal (and
        (current-day d9)
        (workshop-attended) 
        (count-B c3) 
        (count-R c4) 
    ))
)