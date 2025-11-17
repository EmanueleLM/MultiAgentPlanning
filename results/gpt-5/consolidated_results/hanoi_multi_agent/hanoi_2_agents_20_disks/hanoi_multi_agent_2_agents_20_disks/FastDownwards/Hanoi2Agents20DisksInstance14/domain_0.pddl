(define (domain tower-of-hanoi-20)
  (:requirements :strips :typing)
  (:types
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - support)
  )

  (:action move
    :parameters (?x - disk ?from - support ?to - support)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)