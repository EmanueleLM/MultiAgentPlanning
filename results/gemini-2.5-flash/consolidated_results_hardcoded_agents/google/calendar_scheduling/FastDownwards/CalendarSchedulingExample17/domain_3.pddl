(define (domain scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types time-slot)

    (:predicates
        (next ?t1 - time-slot ?t2 - time-slot)
        (current-time ?t - time-slot)
        
        (margaret-free ?t - time-slot)
        (donna-free ?t - time-slot)
        (helen-free ?t - time-slot)

        (helen-preference-ok ?t - time-slot)
        (meeting-scheduled)
    )
    
    (:functions
        (total-cost)
    )

    (:action advance-time
        :parameters (?t_current - time-slot ?t_next - time-slot)
        :precondition (and
            (current-time ?t_current)
            (next ?t_current ?t_next)
            
            ; Ensure we only advance if the current slot is NOT valid
            (or 
                (not (margaret-free ?t_current))
                (not (donna-free ?t_current))
                (not (helen-free ?t_current))
                (not (helen-preference-ok ?t_current))
            )
        )
        :effect (and
            (not (current-time ?t_current))
            (current-time ?t_next)
            (increase (total-cost) 1)
        )
    )

    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (current-time ?t)
            (margaret-free ?t)
            (donna-free ?t)
            (helen-free ?t)
            (helen-preference-ok ?t)
        )
        :effect (meeting-scheduled)
    )