(define (domain hanoi-3peg-10disk)
  (:requirements :strips :typing)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?x - support)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-disk-onto-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (can-move ?ag ?d)
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
    )
  )
)