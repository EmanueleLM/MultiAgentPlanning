(define (domain hanoi-2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    disk peg - support
    agent
  )
  (:predicates
    (on ?d - disk ?x - support)
    (clear ?x - support)
    (smaller ?d1 - disk ?d2 - disk)
    (placeable ?d - disk ?x - support)
    (allowed ?a - agent ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (placeable ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)