(define (problem meeting-schedule)
    (:domain meeting-planning-propositional)
    (:objects
        ; T=0 (9:00 AM)
        ; T=16 (Arrival at MD)
        ; T=75 (10:15 AM, James available start)
        ; T=90 (T75 + 15 min meeting end)
        ; T=108 (T90 + 18 min travel back end)
        ; T=255 (Latest possible start for 15 min meeting)
        ; T=270 (1:30 PM, James available end)
        T0 T16 T75 T90 T108 T255 T270 - time-point
    )
    
    (:init
        (at GGP)
        (current-time T0) ; 9:00 AM start
        (not (met-james))
        (james-at MD)
        
        ; --- Travel Transitions ---
        ; GGP -> MD (16 min)
        (time-transition T0 T16) 
        
        ; MD -> GGP (18 min). Example: Leaving after earliest meeting ends (T90 + 18 = T108)
        (time-transition T90 T108) 
        
        ; --- Wait Transitions (At MD) ---
        ; Wait from arrival (T16) to earliest possible start (T75, 59 min wait)
        (time-transition T16 T75) 
        
        ; Wait from arrival (T16) to latest possible start (T255, 239 min wait)
        (time-transition T16 T255) 
        
        ; --- Meeting Transitions (15 min duration, within [T75, T270]) ---
        ; Start T75, End T90
        (meeting-transition T75 T90) 
        
        ; Start T255, End T270
        (meeting-transition T255 T270)
    )
    
    (:goal (met-james))
)