(define (domain meeting_scheduler)
  (:requirements :strips :typing :adl :fluents :action-costs)
  (:types agent time slot)
  (:constants raymond billy donald - agent)
  (:predicates
    (available ?agent - agent ?slot - slot)
    (meeting_set ?slot - slot)
    (blocked_raymond ?slot - slot)
    (blocked_billy ?slot - slot)
    (blocked_donald ?slot - slot)
    (preferred_time_billy ?slot - slot))
  
  (:functions (total-cost))

  (:action raymond_available
    :parameters (?slot - slot)
    :precondition (not (blocked_raymond ?slot))
    :effect (available raymond ?slot))

  (:action billy_available
    :parameters (?slot - slot)
    :precondition (and (not (blocked_billy ?slot))
                       (preferred_time_billy ?slot))
    :effect (available billy ?slot))

  (:action donald_available
    :parameters (?slot - slot)
    :precondition (not (blocked_donald ?slot))
    :effect (available donald ?slot))

  (:action set_meeting
    :parameters (?slot - slot)
    :precondition (and (available raymond ?slot)
                       (available billy ?slot)
                       (available donald ?slot))
    :effect (and (meeting_set ?slot) (increase (total-cost) 1))))