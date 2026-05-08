(define (domain delivery_domain)
  (:requirements :strips :typing)
  (:types agent package location)

  ;; Declare the agent identities as domain constants so actions can be distinct per agent.
  (:constants
    agent_0 agent_1 agent_2 - agent
  )

  (:predicates
    ;; agent-at ?a ?l  -- agent ?a is at location ?l
    (agent-at ?a - agent ?l - location)

    ;; package-at ?p ?l -- package ?p is at location ?l (not being held)
    (package-at ?p - package ?l - location)

    ;; holding predicates are per-agent so that actions/effects are distinct and causal for each agent
    (holding-a0 ?p - package)
    (holding-a1 ?p - package)
    (holding-a2 ?p - package)
  )

  ;; -----------------------
  ;; Actions for agent_0
  ;; -----------------------
  (:action move-agent_0
    :parameters (?from - location ?to - location)
    :precondition (agent-at agent_0 ?from)
    :effect (and
      (not (agent-at agent_0 ?from))
      (agent-at agent_0 ?to)
    )
  )

  (:action pick-agent_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (agent-at agent_0 ?loc)
      (package-at ?p ?loc)
    )
    :effect (and
      (not (package-at ?p ?loc))
      (holding-a0 ?p)
    )
  )

  (:action drop-agent_0
    :parameters (?p - package ?loc - location)
    :precondition (and
      (agent-at agent_0 ?loc)
      (holding-a0 ?p)
    )
    :effect (and
      (package-at ?p ?loc)
      (not (holding-a0 ?p))
    )
  )

  ;; -----------------------
  ;; Actions for agent_1
  ;; -----------------------
  (:action move-agent_1
    :parameters (?from - location ?to - location)
    :precondition (agent-at agent_1 ?from)
    :effect (and
      (not (agent-at agent_1 ?from))
      (agent-at agent_1 ?to)
    )
  )

  (:action pick-agent_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (agent-at agent_1 ?loc)
      (package-at ?p ?loc)
    )
    :effect (and
      (not (package-at ?p ?loc))
      (holding-a1 ?p)
    )
  )

  (:action drop-agent_1
    :parameters (?p - package ?loc - location)
    :precondition (and
      (agent-at agent_1 ?loc)
      (holding-a1 ?p)
    )
    :effect (and
      (package-at ?p ?loc)
      (not (holding-a1 ?p))
    )
  )

  ;; -----------------------
  ;; Actions for agent_2
  ;; -----------------------
  (:action move-agent_2
    :parameters (?from - location ?to - location)
    :precondition (agent-at agent_2 ?from)
    :effect (and
      (not (agent-at agent_2 ?from))
      (agent-at agent_2 ?to)
    )
  )

  (:action pick-agent_2
    :parameters (?p - package ?loc - location)
    :precondition (and
      (agent-at agent_2 ?loc)
      (package-at ?p ?loc)
    )
    :effect (and
      (not (package-at ?p ?loc))
      (holding-a2 ?p)
    )
  )

  (:action drop-agent_2
    :parameters (?p - package ?loc - location)
    :precondition (and
      (agent-at agent_2 ?loc)
      (holding-a2 ?p)
    )
    :effect (and
      (package-at ?p ?loc)
      (not (holding-a2 ?p))
    )
  )
)