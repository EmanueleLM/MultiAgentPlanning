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
        
        ; Travel GGP -> MD (16 min)
        (time-GGP-MD T0 T16) 
        
        ; Wait transitions (T16 is arrival time, T75 earliest start, T255 latest start)
        (time-wait T16 T75) 
        (time-wait T16 T255) 
        
        ; Meeting Transitions (15 min duration)
        (meeting-transition T75 T90) ; Start 10:15, End 10:30
        (meeting-transition T255 T270) ; Start 1:15 PM, End 1:30 PM
    )
    
    (:goal (met-james))
)