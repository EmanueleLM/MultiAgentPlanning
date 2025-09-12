(define (domain meeting_scheduler_popf2)
  (:requirements :strips :typing :adl :action-costs)
  (:types agent time slot)
  (:constants raymond billy donald - agent)
  (:predicates
    (available ?agent - agent ?slot - slot)
    (meeting_set ?slot - slot)
    (blocked ?agent - agent ?slot - slot)
    (preferred_time_billy ?slot - slot)
    (cost_exceeded))

  (:action raymond_available
    :parameters (?slot - slot)
    :precondition (not (blocked raymond ?slot))
    :effect (available raymond ?slot))

  (:action billy_available
    :parameters (?slot - slot)
    :precondition (and (not (blocked billy ?slot)))
    :effect (available billy ?slot))

  (:action donald_available
    :parameters (?slot - slot)
    :precondition (not (blocked donald ?slot))
    :effect (available donald ?slot))

  (:action set_meeting
    :parameters (?slot - slot)
    :precondition (and (available raymond ?slot)
                       (available billy ?slot)
                       (available donald ?slot)
                       (not (cost_exceeded)))
    :effect (and (meeting_set ?slot) 
                 (when (not (preferred_time_billy ?slot)) (cost_exceeded))))
)