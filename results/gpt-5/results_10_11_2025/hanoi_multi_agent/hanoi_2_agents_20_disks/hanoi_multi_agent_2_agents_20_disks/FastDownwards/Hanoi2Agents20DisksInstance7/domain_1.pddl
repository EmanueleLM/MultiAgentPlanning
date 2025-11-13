(define (domain hanoi2agents20)
  (:requirements :strips :typing)
  (:types
    support
    peg - support
    disk - support
    agent
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (placeable ?d - disk ?s - support)
    (smaller ?x - disk ?y - disk)
    (disk ?d - disk)
    (peg ?p - peg)
    (can-move ?a - agent ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (can-move ?a ?d)
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