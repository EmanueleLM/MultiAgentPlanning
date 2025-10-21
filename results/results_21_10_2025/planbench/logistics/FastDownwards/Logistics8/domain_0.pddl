(define (domain multi-agent-delivery)
  (:requirements :typing :strips :negative-preconditions)
  (:types agent package location)

  (:predicates
    (at ?a - agent ?l - location)
    (package-at ?p - package ?l - location)
    (carrying ?a - agent)
    (carrying-package ?a - agent ?p - package)
    (connected ?l1 - location ?l2 - location)
  )

  ;; Move an agent along a connected link
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

  ;; Pick up a package at the agent location.
  ;; Agents may carry at most one package: enforced by requiring (not (carrying ?ag)).
  (:action pickup
    :parameters (?ag - agent ?p - package ?loc - location)
    :precondition (and
      (at ?ag ?loc)
      (package-at ?p ?loc)
      (not (carrying ?ag))
    )
    :effect (and
      (carrying ?ag)
      (carrying-package ?ag ?p)
      (not (package-at ?p ?loc))
    )
  )

  ;; Drop a carried package at the agent location.
  (:action drop
    :parameters (?ag - agent ?p - package ?loc - location)
    :precondition (and
      (at ?ag ?loc)
      (carrying-package ?ag ?p)
    )
    :effect (and
      (package-at ?p ?loc)
      (not (carrying-package ?ag ?p))
      (not (carrying ?ag))
    )
  )

  ;; Transfer a package between two agents colocated at the same location.
  ;; Receiver must not already be carrying something.
  (:action give
    :parameters (?giver - agent ?receiver - agent ?p - package ?loc - location)
    :precondition (and
      (at ?giver ?loc)
      (at ?receiver ?loc)
      (carrying-package ?giver ?p)
      (not (carrying ?receiver))
    )
    :effect (and
      (not (carrying-package ?giver ?p))
      (carrying-package ?receiver ?p)
      (not (carrying ?giver))
      (carrying ?receiver)
    )
  )
)