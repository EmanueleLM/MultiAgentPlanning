(define (domain hanoi-3agents-15disks)
  (:requirements :strips :typing)
  (:types
    support
    peg disk - support
    agent
  )
  (:predicates
    (agent ?a - agent)
    (disk ?d - disk)
    (peg ?p - peg)
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
    (ok-dest ?d - disk ?s - support)
  )

  (:action move
    :parameters (?ag - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (ok-dest ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)