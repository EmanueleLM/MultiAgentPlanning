(define (domain hanoi-3pegs)
  (:requirements :typing)
  (:types
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - support)
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