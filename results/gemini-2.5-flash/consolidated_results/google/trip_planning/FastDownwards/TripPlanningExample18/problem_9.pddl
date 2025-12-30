(define (problem trip-planning-18)
    (:domain trip-planning)
    (:objects
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    )
    
    (:init
        ; Connections: AMS <-> BUC, VNO <-> AMS
        (connected amsterdam bucharest)
        (connected bucharest amsterdam)
        (connected vilnius amsterdam)
        (connected amsterdam vilnius)
        
        ; Time setup (D0 is start, 11 steps lead to D11)
        (is-day d0)
        (next-day d0 d1) (next-day d1 d2) (next-day d2 d3) (next-day d3 d4) 
        (next-day d4 d5) (next-day d5 d6) (next-day d6 d7) (next-day d7 d8) 
        (next-day d8 d9) (next-day d9 d10) (next-day d10 d11)

        ; Meeting Time Window: Action must start on D5 (Day 6 start) up to D10 (Day 11 start).
        (meeting-time d5) (meeting-time d6) (meeting-time d7)
        (meeting-time d8) (meeting-time d9) (meeting-time d10)

        ; Initial State: Starting at Vilnius is assumed to allow optimal path coverage.
        (at vilnius) 
        (visited vilnius) 
        
        ; Initial Fluents
        (= (total-cost) 0)
    )
    
    (:goal (and
        (is-day d11) ; Trip must end exactly on D11 (11 steps)
        (visited amsterdam)
        (visited bucharest)
        (meeting_achieved)
        
        ; Enforced stay allocation: V=2, A=3, B=4
        (V-S2) 
        (A-S3)
        (B-S4)
    ))

    (:metric minimize (total-cost))
)