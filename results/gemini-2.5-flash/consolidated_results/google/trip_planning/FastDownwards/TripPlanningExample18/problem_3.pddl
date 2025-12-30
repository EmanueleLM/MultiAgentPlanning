(define (problem trip-planning-18)
    (:domain trip-planning)
    (:objects
        amsterdam vilnius bucharest - city
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    )
    
    (:init
        ; Connections: AMS <-> BUC, VNO <-> AMS
        (connected amsterdam bucharest)
        (connected bucharest amsterdam)
        (connected vilnius amsterdam)
        (connected amsterdam vilnius)
        
        ; Time setup (D0 -> D11 sequential steps for 11 days total)
        (is-day d0)
        (next-day d0 d1) (next-day d1 d2) (next-day d2 d3) (next-day d3 d4) 
        (next-day d4 d5) (next-day d5 d6) (next-day d6 d7) (next-day d7 d8) 
        (next-day d8 d9) (next-day d9 d10) (next-day d10 d11)

        ; Initial State: Start at Vilnius
        (at vilnius) 
        (visited vilnius) 
    )
    
    (:goal (and
        (is-day d11) ; Trip must last exactly 11 steps
        (visited amsterdam)
        (visited bucharest)
        (meeting_achieved)
    ))
)