(define (domain link-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent thing)
  (:constants agenta agentb - agent)

  (:predicates
    (next ?a ?b - thing)
    (no-succ ?a - thing)
    (no-pred ?a - thing)
    (available ?ag - agent)
  )

  (:action agenta_link
    :parameters (?x - thing ?y - thing)
    :precondition (and
      (available agenta)
      (no-succ ?x)
      (no-pred ?y)
    )
    :effect (and
      (next ?x ?y)
      (not (no-succ ?x))
      (not (no-pred ?y))
      (not (available agenta))
    )
  )

  (:action agentb_link
    :parameters (?x - thing ?y - thing)
    :precondition (and
      (available agentb)
      (no-succ ?x)
      (no-pred ?y)
    )
    :effect (and
      (next ?x ?y)
      (not (no-succ ?x))
      (not (no-pred ?y))
      (not (available agentb))
    )
  )

  (:action agenta_release
    :parameters ()
    :precondition (and
      (not (available agenta))
    )
    :effect (and
      (available agenta)
    )
  )

  (:action agentb_release
    :parameters ()
    :precondition (and
      (not (available agentb))
    )
    :effect (and
      (available agentb)
    )
  )
)