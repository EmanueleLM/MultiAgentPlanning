(define (domain link-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent thing)

  (:predicates
    (next ?a ?b - thing)        ; successor relation: a -> b
    (no-succ ?a - thing)        ; a currently has no successor
    (no-pred ?a - thing)        ; a currently has no predecessor
    (available ?ag - agent)     ; agent is available to perform a link
  )

  ;; Agent-specific linking actions. Each action requires the specific agent be available.
  ;; Actions enforce uniqueness of successors and predecessors by relying on the
  ;; no-succ / no-pred predicates. Once a link is created those predicates are removed
  ;; so further links that would violate uniqueness are impossible.
  (:action agentA_link
    :parameters (?x - thing ?y - thing)
    :precondition (and
      (available agentA)
      (no-succ ?x)
      (no-pred ?y)
    )
    :effect (and
      (next ?x ?y)
      (not (no-succ ?x))
      (not (no-pred ?y))
      (not (available agentA))
    )
  )

  (:action agentB_link
    :parameters (?x - thing ?y - thing)
    :precondition (and
      (available agentB)
      (no-succ ?x)
      (no-pred ?y)
    )
    :effect (and
      (next ?x ?y)
      (not (no-succ ?x))
      (not (no-pred ?y))
      (not (available agentB))
    )
  )

  ;; Release actions allow agents to become available again but only when they are not available,
  ;; preventing accidental double-release and preserving the hard constraint that availability must
  ;; be explicitly managed.
  (:action agentA_release
    :parameters ()
    :precondition (and
      (not (available agentA))
    )
    :effect (and
      (available agentA)
    )
  )

  (:action agentB_release
    :parameters ()
    :precondition (and
      (not (available agentB))
    )
    :effect (and
      (available agentB)
    )
  )
)