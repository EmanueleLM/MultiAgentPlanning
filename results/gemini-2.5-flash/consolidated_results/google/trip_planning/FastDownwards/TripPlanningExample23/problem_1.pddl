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

        ; Day transitions (8 days of planning)
        (next-day d1 d2) (next-day d2 d3) (next-day d3 d4) 
        (next-day d4 d5) (next-day d5 d6) (next-day d6 d7) 
        (next-day d7 d8) (next-day d8 d9)
        
        ; Count transitions
        (next-count c0 c1) (next-count c1 c2) 
        (next-count c2 c3) (next-count c3 c4)

        ; Initial State (Start at Bucharest to maximize B stays D1-D3, allowing D4 travel to R by D5)
        (current-day d1)
        (at bucharest) 
        (count-L c0) (count-B c0) (count-R c0)
    )

    (:goal (and
        (current-day d9) ; Trip ends after D8
        (workshop-attended) ; R must be visited D5-D8 (4 days)
        (count-B c3) ; Maximum possible Bucharest stay (3 days)
        (count-R c4) ; Required Riga stay (4 days total)
    ))
)