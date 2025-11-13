(define (domain hanoi-2agent-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    (clear ?s - support)
    (on ?d - disk ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (can-stack ?d - disk ?s - support)
  )
  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (can-move ?a ?d)
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