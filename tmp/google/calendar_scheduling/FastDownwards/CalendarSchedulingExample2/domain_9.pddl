(define (domain integrated_meeting_scheduler)
  (:requirements :strips :typing)
  
  (:types 
    time-slot
  )
  
  (:predicates
    (available ?slot - time-slot)
    (meeting-scheduled ?slot - time-slot)
    (agent1-scheduled ?slot - time-slot)
    (agent2-scheduled ?slot - time-slot)
    (agent3-scheduled ?slot - time-slot)
    (free ?slot - time-slot)
    (preferred ?slot - time-slot)
    (blocked ?slot - time-slot)
  )
  
  (:action schedule_agent1
    :parameters (?slot - time-slot)
    :precondition (not (blocked ?slot))
    :effect (agent1-scheduled ?slot)
  )
  
  (:action schedule_agent2
    :parameters (?slot - time-slot)
    :precondition (not (blocked ?slot))
    :effect (agent2-scheduled ?slot)
  )
  
  (:action schedule_agent3
    :parameters (?slot - time-slot)
    :precondition (and (free ?slot) (preferred ?slot) (not (blocked ?slot)))
    :effect (agent3-scheduled ?slot)
  )
  
  (:action finalize_meeting
    :parameters (?slot - time-slot)
    :precondition (and (agent1-scheduled ?slot) (agent2-scheduled ?slot) (agent3-scheduled ?slot))
    :effect (meeting-scheduled ?slot)
  )
)