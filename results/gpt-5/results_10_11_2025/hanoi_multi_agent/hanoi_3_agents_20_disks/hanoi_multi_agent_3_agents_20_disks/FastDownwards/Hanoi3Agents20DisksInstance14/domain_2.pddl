(define (domain hanoi-with-agents)
  (:requirements :strips :typing)
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

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (agent ?a)
      (disk ?d)
      (support ?from)
      (peg ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (agent ?a)
      (disk ?d)
      (support ?from)
      (disk ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?a ?d)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)