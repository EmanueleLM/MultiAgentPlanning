(define (domain integrated_meeting_scheduler)
  (:requirements :strips :typing)
  
  (:types 
    time-slot
  )
  
  (:predicates
    (available ?slot - time-slot)
    (meeting-scheduled ?slot - time-slot)
    (scheduled ?t - time-slot)
    (free ?slot - time-slot)
    (preferred ?slot - time-slot)
    (blocked ?slot - time-slot)
  )
  
  (:action schedule_agent1
    :parameters (?slot - time-slot)
    :precondition (available ?slot)
    :effect (and (meeting-scheduled ?slot) (not (available ?slot)))
  )
  
  (:action schedule_agent2
    :parameters (?t - time-slot)
    :precondition (available ?t)
    :effect (and (scheduled ?t) (not (available ?t)))
  )
  
  (:action schedule_agent3
    :parameters (?slot - time-slot)
    :precondition (and (free ?slot) (preferred ?slot) (not (blocked ?slot)))
    :effect (not (free ?slot))
  )
)