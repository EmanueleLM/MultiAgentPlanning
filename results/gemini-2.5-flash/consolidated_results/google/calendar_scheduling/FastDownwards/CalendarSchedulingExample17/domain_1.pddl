(define (domain scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types time-slot)

    (:predicates
        (next ?t1 - time-slot ?t2 - time-slot)
        (current-time ?t - time-slot)
        
        ; Individual availability based on blocked schedule
        (margaret-free ?t - time-slot)
        (donna-free ?t - time-slot)
        (helen-free ?t - time-slot)

        ; Strict Constraint: Helen's preference (Meeting must start before 13:30)
        (helen-preference-ok ?t - time-slot)

        ; Goal state
        (meeting-scheduled)
    )

    ; Action to move to the next time slot if the current one is not valid
    (:action advance-time
        :parameters (?t_current - time-slot ?t_next - time-slot)
        :precondition (and
            (current-time ?t_current)
            (next ?t_current ?t_next)
            
            ; Ensure we only advance if the current slot is NOT valid (using negation of the required conjunction)
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
        )
    )

    ; Action to schedule the meeting if all constraints are met
    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (current-time ?t)
            (margaret-free ?t)
            (donna-free ?t)
            (helen-free ?t)
            (helen-preference-ok ?t) ; Enforces the strict preference constraint
        )
        :effect (meeting-scheduled)
    )
)