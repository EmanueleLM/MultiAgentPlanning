(define (domain meeting_scheduler)
  (:requirements :strips :typing :adl :fluents :action-costs)
  (:types agent time)
  (:constants raymond billy donald - agent)
  (:predicates
    (available ?agent - agent ?time - time)
    (meeting_set ?time - time)
    (blocked_raymond ?time - time)
    (blocked_billy ?time - time)
    (blocked_donald ?time - time)
    (preferred_billy ?time - time))
  
  (:functions (total-cost))

  (:action raymond_available
    :parameters (?time - time)
    :precondition (not (blocked_raymond ?time))
    :effect (available raymond ?time))

  (:action billy_available
    :parameters (?time - time)
    :precondition (and (not (blocked_billy ?time))
                       (preferred_billy ?time))
    :effect (available billy ?time))

  (:action donald_available
    :parameters (?time - time)
    :precondition (not (blocked_donald ?time))
    :effect (available donald ?time))

  (:action set_meeting
    :parameters (?time - time)
    :precondition (and (available raymond ?time)
                       (available billy ?time)
                       (available donald ?time))
    :effect (and (meeting_set ?time) (increase (total-cost) 1))))