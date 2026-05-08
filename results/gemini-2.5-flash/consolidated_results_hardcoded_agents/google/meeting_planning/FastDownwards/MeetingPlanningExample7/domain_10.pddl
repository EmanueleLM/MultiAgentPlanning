(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location - object
    )
    
    (:constants
        richmond-district north-beach - location
    )
    
    (:predicates
        (at ?l - location) 
        (met-john)        
        
        ; Symbolic time windows (T relative to 9:00 AM, in minutes):
        (time-pre-375)          ; T < 375 (Before 3:15 PM)
        (time-window-375-420)   ; T >= 375 and T <= 420 (Safe meeting start window: 3:15 PM to 4:00 PM)
        (time-window-421-495)   ; T > 420 and T <= 495 (John available, meeting impossible to start if not started by 420)
        (time-post-495)         ; T > 495 (John gone, 5:15 PM)
    )
    
    (:functions
        (total-time)
    )

    ; Travel from Richmond District (RD) to North Beach (NB) - 17 minutes
    (:action travel-rd-nb
        :parameters ()
        :precondition (and 
            (at richmond-district)
            (time-pre-375)
        )
        :effect (and
            (not (at richmond-district))
            (at north-beach)
            (increase (total-time) 17) 
        )
    )

    ; Travel from North Beach (NB) to Richmond District (RD) - 18 minutes
    (:action travel-nb-rd
        :parameters ()
        :precondition (at north-beach)
        :effect (and
            (not (at north-beach))
            (at richmond-district)
            (increase (total-time) 18) 
        )
    )

    ; Wait until T=375 (3:15 PM). Assumes optimal travel path (17 min) followed by 358 min wait.
    (:action wait-to-start-window
        :parameters ()
        :precondition (and 
            (at north-beach)
            (time-pre-375)
        )
        :effect (and
            (not (time-pre-375))
            (time-window-375-420) ; Transition to T=375 (3:15 PM)
            (increase (total-time) 358) 
        )
    )

    ; Meet John for exactly 75 minutes. Must start during the safe window [375, 420].
    (:action meet-john-75min
        :parameters ()
        :precondition (and 
            (at north-beach)
            (time-window-375-420)
        )
        :effect (and
            (met-john)
            (not (time-window-375-420))
            (time-window-421-495) ; Time progresses 75 min (meeting ends at T=450 earliest)
            (increase (total-time) 75) 
        )
    )

    ; Delay/Wait 45 minutes, consuming the safe window (T=375 to T=420). Prevents meeting.
    (:action wait-and-close-safe-window
        :parameters ()
        :precondition (and 
            (at north-beach)
            (time-window-375-420)
            (not (met-john))
        )
        :effect (and
            (not (time-window-375-420))
            (time-window-421-495) 
            (increase (total-time) 45) 
        )
    )

    ; Wait until John leaves (T=495). This path is only taken if the meeting failed (T >= 421).
    (:action wait-until-john-leaves
        :parameters ()
        :precondition (and 
            (at north-beach)
            (time-window-421-495)
            (not (met-john))
        )
        :effect (and
            (not (time-window-421-495))
            (time-post-495) 
            (increase (total-time) 75) ; 75 min wait (420 -> 495)
        )
    )
)