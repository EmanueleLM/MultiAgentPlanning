(define (domain scheduling)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        time-slot
    )
    (:predicates
        (next ?t1 - time-slot ?t2 - time-slot)
        (current-time ?t - time-slot)
        (meeting-scheduled)

        ; Availability predicates
        (margaret-free ?t - time-slot)
        (donna-free ?t - time-slot)
        (helen-free ?t - time-slot)
        
        ; Preference constraint enforcement
        (helen-preference-ok ?t - time-slot)
    )

    (:functions
        (total-cost)
    )

    ; Action 1: Schedule the meeting if all participants are free and preference is met at the current time slot ?t.
    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (current-time ?t)
            (margaret-free ?t)
            (donna-free ?t)
            (helen-free ?t)
            (helen-preference-ok ?t) 
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
        )
    )
    
    ; Action 2: Advance time to the next slot if scheduling hasn't happened.
    ; This action accumulates cost (1 unit per slot checked) to prioritize the earliest valid time slot.
    (:action advance-time
        :parameters (?t1 ?t2 - time-slot)
        :precondition (and
            (current-time ?t1)
            (next ?t1 ?t2)
            (not (meeting-scheduled))
        )
        :effect (and
            (not (current-time ?t1))
            (current-time ?t2)
            (increase (total-cost) 1)
        )
    )
)