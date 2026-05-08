(define (domain pddl_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent package location)

  (:predicates
    ;; agent at a location
    (at-agent ?a - agent ?l - location)
    ;; package at a location (only true when not being carried)
    (at-package ?p - package ?l - location)
    ;; agent is carrying a package
    (carrying ?a - agent ?p - package)
    ;; agent is free to pick up a package (not carrying anything)
    (free ?a - agent)
    ;; connectivity between locations (direct travel allowed)
    (connected ?l1 - location ?l2 - location)
  )

  ;; Actions are kept distinct per agent as required.
  ;; Agent 0 actions
  (:action move-agent_0
    :parameters (?from - location ?to - location)
    :precondition (and (at-agent agent_0 ?from) (connected ?from ?to))
    :effect (and (not (at-agent agent_0 ?from)) (at-agent agent_0 ?to))
  )

  (:action pickup-agent_0
    :parameters (?p - package ?l - location)
    :precondition (and (at-agent agent_0 ?l) (at-package ?p ?l) (free agent_0))
    :effect (and
              (not (at-package ?p ?l))
              (carrying agent_0 ?p)
              (not (free agent_0))
            )
  )

  (:action drop-agent_0
    :parameters (?p - package ?l - location)
    :precondition (and (at-agent agent_0 ?l) (carrying agent_0 ?p))
    :effect (and
              (at-package ?p ?l)
              (not (carrying agent_0 ?p))
              (free agent_0)
            )
  )

  ;; Agent 1 actions
  (:action move-agent_1
    :parameters (?from - location ?to - location)
    :precondition (and (at-agent agent_1 ?from) (connected ?from ?to))
    :effect (and (not (at-agent agent_1 ?from)) (at-agent agent_1 ?to))
  )

  (:action pickup-agent_1
    :parameters (?p - package ?l - location)
    :precondition (and (at-agent agent_1 ?l) (at-package ?p ?l) (free agent_1))
    :effect (and
              (not (at-package ?p ?l))
              (carrying agent_1 ?p)
              (not (free agent_1))
            )
  )

  (:action drop-agent_1
    :parameters (?p - package ?l - location)
    :precondition (and (at-agent agent_1 ?l) (carrying agent_1 ?p))
    :effect (and
              (at-package ?p ?l)
              (not (carrying agent_1 ?p))
              (free agent_1)
            )
  )

  ;; Agent 2 actions
  (:action move-agent_2
    :parameters (?from - location ?to - location)
    :precondition (and (at-agent agent_2 ?from) (connected ?from ?to))
    :effect (and (not (at-agent agent_2 ?from)) (at-agent agent_2 ?to))
  )

  (:action pickup-agent_2
    :parameters (?p - package ?l - location)
    :precondition (and (at-agent agent_2 ?l) (at-package ?p ?l) (free agent_2))
    :effect (and
              (not (at-package ?p ?l))
              (carrying agent_2 ?p)
              (not (free agent_2))
            )
  )

  (:action drop-agent_2
    :parameters (?p - package ?l - location)
    :precondition (and (at-agent agent_2 ?l) (carrying agent_2 ?p))
    :effect (and
              (at-package ?p ?l)
              (not (carrying agent_2 ?p))
              (free agent_2)
            )
  )

)