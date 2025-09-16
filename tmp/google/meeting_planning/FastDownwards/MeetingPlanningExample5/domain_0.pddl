(define (domain coordinated-meeting)
  (:requirements :strips :typing :multi-agent)
  
  (:types agent location time - object)

  (:predicates
    (available ?a - agent ?t - time)
    (at ?a - agent ?l - location)
    (connected ?l1 ?l2 - location)
    (meeting-scheduled ?a1 ?a2 - agent ?t - time)
  )
  
  (:action agent1-move
    :parameters (?a - agent ?from ?to - location)
    :precondition (and (at ?a ?from) (connected ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
  
  (:action agent2-move
    :parameters (?a - agent ?from ?to - location)
    :precondition (and (at ?a ?from) (connected ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
  
  (:action schedule-meeting
    :parameters (?a1 ?a2 - agent ?t - time)
    :precondition (and (available ?a1 ?t) (available ?a2 ?t))
    :effect (meeting-scheduled ?a1 ?a2 ?t)
  )
)