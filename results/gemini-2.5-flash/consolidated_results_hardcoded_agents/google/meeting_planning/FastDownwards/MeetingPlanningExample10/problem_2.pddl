(define (problem meeting-schedule)
    (:domain meeting-planning)
    (:objects
        T0 T16 T75 T90 T255 T270 - time-point
    )
    
    (:init
        (at GGP)
        (current-time T0) ; 9:00 AM start
        (not (met-james))
        (james-at MD)
        
        ; --- Travel Transitions ---
        ; GGP -> MD (16 min). Only T0->T16 is defined for this segment
        (time-GGP-MD T0 T16) 
        
        ; MD -> GGP (18 min). Not needed for goal, but defined placeholder T90->T(90+18=108) removed as T108 is not defined.
        
        ; --- Wait Transitions (at MD) ---
        ; Wait from arrival (T16) to earliest possible meeting start (T75, 59 min wait)
        (time-wait T16 T75) 
        
        ; Wait from arrival (T16) to latest possible meeting start (T255, 239 min wait)
        (time-wait T16 T255) 
        
        ; --- Meeting Transitions (15 min duration, within [T75, T270]) ---
        (meeting-transition T75 T90) ; Earliest meet
        (meeting-transition T255 T270) ; Latest meet
    )
    
    (:goal (met-james))
)