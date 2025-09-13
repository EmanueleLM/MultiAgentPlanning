```lisp
(define (domain integrated_meeting_scheduler)
    (:requirements :strips :typing)
    
    (:types person time-slot)
    
    (:predicates 
        ;; Unified predicates
        (free ?person - person ?slot - time-slot)
        (available ?person - person ?slot - time-slot)

        ;; Meeting status
        (meeting_scheduled)

        ;; Time slot scheduled
        (scheduled ?slot - time-slot)
    )

    ;; Action from the first agent
    (:action schedule_meeting_agent1
        :parameters (?slot - time-slot)
        :precondition (and (free diane ?slot) (free deborah ?slot) (not (meeting_scheduled)))
        :effect (and (meeting_scheduled) (scheduled ?slot))
    )

    ;; Action from the second agent
    (:action schedule_meeting_agent2
        :parameters (?slot - time-slot)
        :precondition (and (available Diane ?slot)
                           (available Kelly ?slot)
                           (available Deborah ?slot)
                           (not (scheduled ?slot)))
        :effect (and (meeting_scheduled) (scheduled ?slot))
    )

    ;; Action from the third agent
    (:action schedule_meeting_agent3
        :parameters (?p1 - person ?p2 - person ?slot - time-slot)
        :precondition (and (available ?p1 ?slot) (available ?p2 ?slot) (not (meeting_scheduled)))
        :effect (and (meeting_scheduled) (scheduled ?slot))
    )
)
```