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
    (blocked-agent1 ?slot - time-slot)
    (blocked-agent2 ?slot - time-slot)
    (blocked-agent3 ?slot - time-slot)
    (preferred-agent3 ?slot - time-slot)
  )
  
  (:action schedule_agent1
    :parameters (?slot - time-slot)
    :precondition (not (blocked-agent1 ?slot))
    :effect (agent1-scheduled ?slot)
  )
  
  (:action schedule_agent2
    :parameters (?slot - time-slot)
    :precondition (not (blocked-agent2 ?slot))
    :effect (agent2-scheduled ?slot)
  )
  
  (:action schedule_agent3
    :parameters (?slot - time-slot)
    :precondition (and (not (blocked-agent3 ?slot)) (preferred-agent3 ?slot))
    :effect (agent3-scheduled ?slot)
  )
  
  (:action finalize_meeting
    :parameters (?slot - time-slot)
    :precondition (and (agent1-scheduled ?slot) (agent2-scheduled ?slot) (agent3-scheduled ?slot))
    :effect (meeting-scheduled ?slot)
  )
)