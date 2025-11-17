(define (domain hanoi-single-move)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d - disk ?s - support)
  )

  (:action move
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (clear ?d)
      (on ?d ?from)
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