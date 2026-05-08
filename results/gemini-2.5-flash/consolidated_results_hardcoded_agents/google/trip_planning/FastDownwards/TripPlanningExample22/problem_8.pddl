(define (problem trip-planning-p22)
    (:domain trip-planning-orchestrator)
    (:objects
        ; All objects defined as constants in the domain
    )
    
    (:init
        ; Connectivity: B <-> F, F <-> Bu
        (connected berlin frankfurt)
        (connected frankfurt berlin)
        (connected frankfurt bucharest)
        (connected bucharest frankfurt)

        ; Day transitions (D1 to D12)
        (next-day d1 d2) (next-day d2 d3) (next-day d3 d4) (next-day d4 d5)
        (next-day d5 d6) (next-day d6 d7) (next-day d7 d8) (next-day d8 d9)
        (next-day d9 d10) (next-day d10 d11) (next-day d11 d12)

        ; Show Window Days (D1 to D7)
        (day-is-in-show-window d1) (day-is-in-show-window d2) (day-is-in-show-window d3)
        (day-is-in-show-window d4) (day-is-in-show-window d5) (day-is-in-show-window d6)
        (day-is-in-show-window d7)
        
        ; Initial location and time: Start on D1 at Berlin
        (current-day d1)
        (at berlin) 

        ; Initial duration counts (C0)
        (days-in-frankfurt c0)
        (days-in-bucharest c0)
        (days-in-berlin-show c0)
        
        (= (total-cost) 0)
    )

    (:goal (and
        ; 1. Trip duration must be exactly 11 days
        (current-day d12)
        
        ; 2. Berlin show requirement met (Exactly 7 days D1-D7)
        (days-in-berlin-show c7)
        
        ; 3. Frankfurt minimum required days (>= 1 day, achieved via redefined frankfurt-min-met)
        (frankfurt-min-met)
        
        ; 4. Bucharest minimum required days (>= 1 day, achieved via redefined bucharest-min-met)
        (bucharest-min-met)
    ))
    
    (:metric minimize (total-cost))
)