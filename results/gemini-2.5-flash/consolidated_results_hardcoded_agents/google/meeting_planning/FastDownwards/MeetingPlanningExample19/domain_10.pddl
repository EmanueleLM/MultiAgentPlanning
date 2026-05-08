(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location
    )
    (:constants
        ggp - location
        ph - location
    )
    (:predicates
        (at ?l - location)
        (met-john)
        ; Symbolic time points (minutes from 9:00 AM = T=0)
        (time-0)        ; 9:00 AM Start
        (time-644)      ; 7:44 PM Latest departure time (T=660 - 16 min travel)
        (time-660)      ; 8:00 PM Meeting start time (Min required arrival)
        (time-705-reached) ; 8:45 PM Meeting end time (John's hard deadline)
    )
    (:functions
        (total-cost)
    )

    ;; 1. Wait action: Jumps time from T=0 (9:00 AM) to T=644 (7:44 PM).
    (:action wait_for_departure
        :parameters ()
        :precondition (and 
            (at ggp)
            (time-0)
        )
        :effect (and
            (not (time-0))
            (time-644)
            (increase (total-cost) 0)
        )
    )
    
    ;; 2. Travel GGP -> PH (16 min). Must happen at T=644, arriving T=660.
    (:action travel_ggp_to_ph
        :parameters ()
        :precondition (and
            (at ggp)
            (time-644)
        )
        :effect (and
            (not (at ggp))
            (at ph)
            (not (time-644))
            (time-660)
            (increase (total-cost) 1) 
        )
    )
    
    ;; 3. Meet John (Fixed 45 min duration). Starts T=660 (8:00 PM), ends T=705 (8:45 PM).
    (:action meet_john
        :parameters ()
        :precondition (and 
            (at ph)
            (time-660)
            (not (met-john))
        )
        :effect (and
            (met-john)
            (not (time-660))
            (time-705-reached)
            (increase (total-cost) 0)
        )
    )
)