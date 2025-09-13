(define (domain integrated_meeting_scheduler)
  (:requirements :strips :typing)
  
  (:types 
    time-slot
  )
  
  (:predicates
    ;; Agent 1 predicates
    (available ?slot - time-slot)
    (meeting-scheduled ?slot - time-slot)
    
    ;; Agent 2 predicates
    (scheduled ?t - time-slot)
    
    ;; Agent 3 predicates
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
    :precondition (and (free ?slot) (preferred ?slot))
    :effect (not (free ?slot))
  )
)