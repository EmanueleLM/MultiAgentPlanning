(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location
    )
    (:predicates
        (at ?l - location)
        (met-john)
    )
    (:functions
        (current-time) ; Tracks elapsed minutes since 9:00 AM (T=0)
        (total-cost)
    )

    ;; 1. Wait action: Jumps time from T=0 (9:00 AM) to T=644 (7:44 PM), which is the latest necessary departure time 
    ;; to allow 16 min travel and 45 min meeting duration, ending exactly at the 8:45 PM deadline (T=705).
    (:action wait_for_departure
        :parameters ()
        :precondition (and 
            (at ggp)
            (= (current-time) 0)
        )
        :effect (and
            (assign (current-time) 644) ; Time jump to 7:44 PM
        )
    )
    
    ;; 2. Travel GGP -> PH (16 min)
    (:action travel_ggp_to_ph
        :parameters ()
        :precondition (and
            (at ggp)
            ; Departure must be T <= 644
            (<= (current-time) 644)
        )
        :effect (and
            (not (at ggp))
            (at ph)
            (increase (current-time) 16) ; Arrival time T_arrival = T_departure + 16. T_arrival <= 660.
            (increase (total-cost) 1) 
        )
    )
    
    ;; 3. Meet John (Fixed 45 min duration)
    (:action meet_john
        :parameters ()
        :precondition (and 
            (at ph)
            ; Must start within John's window (>= 645)
            (>= (current-time) 645) 
            ; Must end within John's window (T_start + 45 <= 705). Implies T_start <= 660.
            (<= (current-time) 660)
            (not (met-john))
        )
        :effect (and
            (met-john)
            (increase (current-time) 45) ; Meeting ends exactly 45 min later, maximum end time T=705
        )
    )
)