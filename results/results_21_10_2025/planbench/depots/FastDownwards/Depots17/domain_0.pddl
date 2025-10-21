(define (domain multiagent-delivery)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent package location)

  (:predicates
    (at ?ag - agent ?loc - location)            ; agent at location
    (at_obj ?pkg - package ?loc - location)     ; package at location (not held)
    (holding ?ag - agent ?pkg - package)        ; agent holds package
    (connected ?l1 - location ?l2 - location)   ; bidirectional connection between locations
  )

  ;; Move an agent between connected locations
  (:action move
    :parameters (?ag - agent ?from - location ?to - location)
    :precondition (and
      (at ?ag ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
    )
  )

  ;; Pick up a package at the agent's current location
  (:action pick-up
    :parameters (?ag - agent ?pkg - package ?loc - location)
    :precondition (and
      (at ?ag ?loc)
      (at_obj ?pkg ?loc)
    )
    :effect (and
      (not (at_obj ?pkg ?loc))
      (holding ?ag ?pkg)
    )
  )

  ;; Put down a package at the agent's current location
  (:action put-down
    :parameters (?ag - agent ?pkg - package ?loc - location)
    :precondition (and
      (at ?ag ?loc)
      (holding ?ag ?pkg)
    )
    :effect (and
      (not (holding ?ag ?pkg))
      (at_obj ?pkg ?loc)
    )
  )

  ;; Handover a package from one agent to another when co-located
  (:action handover
    :parameters (?giver - agent ?receiver - agent ?pkg - package ?loc - location)
    :precondition (and
      (at ?giver ?loc)
      (at ?receiver ?loc)
      (holding ?giver ?pkg)
      (not (holding ?receiver ?pkg))
    )
    :effect (and
      (not (holding ?giver ?pkg))
      (holding ?receiver ?pkg)
    )
  )
)