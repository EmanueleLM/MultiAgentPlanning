(define (domain hanoi20-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (can-stack ?d - disk ?s - support)
    (can-move ?a - agent ?d - disk)
  )

  (:action move
    :parameters (?ag - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)