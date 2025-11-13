(define (domain hanoi-with-agents)
  (:requirements :strips :typing :adl)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (agent ?a - agent)
    (disk ?d - disk)
    (peg ?p - peg)
    (support ?s - support)
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (allowed ?a - agent ?d - disk)
    (larger ?x - disk ?y - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (agent ?a)
      (disk ?d)
      (support ?from)
      (support ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?a ?d)
      (or (peg ?to) (larger ?to ?d))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)