(define (domain delivery-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location item)

  (:predicates
    (at ?a - agent ?l - location)
    (at-item ?o - item ?l - location)
    (holding ?a - agent ?o - item)
    (handfree ?a - agent)
    (connected ?l1 - location ?l2 - location)
  )

  ;; Player movement (agent-specific action)
  (:action move-player
    :parameters (?p - agent ?from - location ?to - location)
    :precondition (and (at ?p ?from) (connected ?from ?to))
    :effect (and (not (at ?p ?from)) (at ?p ?to))
  )

  ;; Observer movement (agent-specific action)
  (:action move-observer
    :parameters (?o - agent ?from - location ?to - location)
    :precondition (and (at ?o ?from) (connected ?from ?to))
    :effect (and (not (at ?o ?from)) (at ?o ?to))
  )

  ;; Pickup by an agent (player or observer can use this if present)
  (:action pickup
    :parameters (?a - agent ?obj - item ?loc - location)
    :precondition (and (at ?a ?loc) (at-item ?obj ?loc) (handfree ?a))
    :effect (and (not (at-item ?obj ?loc)) (holding ?a ?obj) (not (handfree ?a)))
  )

  ;; Drop by an agent
  (:action drop
    :parameters (?a - agent ?obj - item ?loc - location)
    :precondition (and (at ?a ?loc) (holding ?a ?obj))
    :effect (and (at-item ?obj ?loc) (not (holding ?a ?obj)) (handfree ?a))
  )
)