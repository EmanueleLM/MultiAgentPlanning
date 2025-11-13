(define (domain hanoi-20-twoagent)
  (:requirements :strips :typing)
  (:types
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d - disk ?s - support)
  )

  (:action move
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
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