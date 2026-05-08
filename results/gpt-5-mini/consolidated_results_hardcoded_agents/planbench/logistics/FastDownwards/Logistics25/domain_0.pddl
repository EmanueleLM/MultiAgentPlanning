(define (domain pddl_orchestrator_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent package location)

  (:predicates
    ;; agent and package locations
    (at-agent ?a - agent ?l - location)
    (at-package ?p - package ?l - location)

    ;; map connectivity (directed adjacency; include both directions in problem)
    (adjacent ?from - location ?to - location)

    ;; agent-specific carrying and free-status predicates (actions distinct per agent)
    (carrying-agentA ?p - package)
    (carrying-agentB ?p - package)

    (free-agentA)
    (free-agentB)
  )

  ;; Actions for agent_A
  (:action pick_agentA
    :parameters (?p - package ?loc - location)
    :precondition (and
                    (at-agent agent_A ?loc)
                    (at-package ?p ?loc)
                    (free-agentA)
                    ;; audited correction: prevent picking if other agent already carrying the package
                    (not (carrying-agentB ?p))
                  )
    :effect (and
              ;; agent A picks up package: package removed from location and marked carried
              (not (at-package ?p ?loc))
              (carrying-agentA ?p)
              (not (free-agentA))
            )
  )

  (:action drop_agentA
    :parameters (?p - package ?loc - location)
    :precondition (and
                    (at-agent agent_A ?loc)
                    (carrying-agentA ?p)
                  )
    :effect (and
              ;; agent A places package at the agent's location
              (at-package ?p ?loc)
              (not (carrying-agentA ?p))
              (free-agentA)
            )
  )

  ;; move when agent_A is not carrying anything
  (:action move_agentA_empty
    :parameters (?from - location ?to - location)
    :precondition (and
                    (at-agent agent_A ?from)
                    (adjacent ?from ?to)
                    (free-agentA)
                  )
    :effect (and
              (not (at-agent agent_A ?from))
              (at-agent agent_A ?to)
            )
  )

  ;; move when agent_A is carrying a package; explicit params to update package location consistently
  (:action move_agentA_loaded
    :parameters (?p - package ?from - location ?to - location)
    :precondition (and
                    (at-agent agent_A ?from)
                    (adjacent ?from ?to)
                    (carrying-agentA ?p)
                  )
    :effect (and
              ;; move agent
              (not (at-agent agent_A ?from))
              (at-agent agent_A ?to)

              ;; update package "visible" location to follow agent while carried
              ;; remove any stale predicate at ?from (safe deletion); add at new location
              (not (at-package ?p ?from))
              (at-package ?p ?to)
            )
  )

  ;; Actions for agent_B (distinct, symmetric to agent_A)
  (:action pick_agentB
    :parameters (?p - package ?loc - location)
    :precondition (and
                    (at-agent agent_B ?loc)
                    (at-package ?p ?loc)
                    (free-agentB)
                    ;; audited correction: prevent picking if other agent already carrying the package
                    (not (carrying-agentA ?p))
                  )
    :effect (and
              (not (at-package ?p ?loc))
              (carrying-agentB ?p)
              (not (free-agentB))
            )
  )

  (:action drop_agentB
    :parameters (?p - package ?loc - location)
    :precondition (and
                    (at-agent agent_B ?loc)
                    (carrying-agentB ?p)
                  )
    :effect (and
              (at-package ?p ?loc)
              (not (carrying-agentB ?p))
              (free-agentB)
            )
  )

  (:action move_agentB_empty
    :parameters (?from - location ?to - location)
    :precondition (and
                    (at-agent agent_B ?from)
                    (adjacent ?from ?to)
                    (free-agentB)
                  )
    :effect (and
              (not (at-agent agent_B ?from))
              (at-agent agent_B ?to)
            )
  )

  (:action move_agentB_loaded
    :parameters (?p - package ?from - location ?to - location)
    :precondition (and
                    (at-agent agent_B ?from)
                    (adjacent ?from ?to)
                    (carrying-agentB ?p)
                  )
    :effect (and
              (not (at-agent agent_B ?from))
              (at-agent agent_B ?to)

              (not (at-package ?p ?from))
              (at-package ?p ?to)
            )
  )
)