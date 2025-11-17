(define (domain hanoi-2agent)
  (:requirements :strips :typing)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (can-move ?a ?d)
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

  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk)
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
    )
  )
)