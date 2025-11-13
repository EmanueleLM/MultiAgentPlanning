(define (domain hanoi-2agent-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d - disk ?s - support)
    (can-move ?a - agent ?d - disk)
    (peg ?p - peg)
    (top ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (top ?d)
    )
  )
)