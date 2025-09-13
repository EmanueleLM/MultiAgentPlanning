(define (domain integrated_meeting_scheduler)
    (:requirements :strips :typing)
    
    (:types person time-slot)
    
    (:predicates 
        (free ?person - person ?slot - time-slot)
        (available ?person - person ?slot - time-slot)
        (meeting_scheduled)
        (scheduled ?slot - time-slot)
    )

    (:action schedule_meeting_agent1
        :parameters (?slot - time-slot)
        :precondition (and (free diane ?slot) (free deborah ?slot) (not (meeting_scheduled)))
        :effect (and (meeting_scheduled) (scheduled ?slot))
    )

    (:action schedule_meeting_agent2
        :parameters (?slot - time-slot)
        :precondition (and (available diane ?slot)
                           (available kelly ?slot)
                           (available deborah ?slot)
                           (not (scheduled ?slot)))
        :effect (and (meeting_scheduled) (scheduled ?slot))
    )

    (:action schedule_meeting_agent3
        :parameters (?p1 - person ?p2 - person ?slot - time-slot)
        :precondition (and (available ?p1 ?slot) (available ?p2 ?slot) (not (meeting_scheduled)))
        :effect (and (meeting_scheduled) (scheduled ?slot))
    )
)