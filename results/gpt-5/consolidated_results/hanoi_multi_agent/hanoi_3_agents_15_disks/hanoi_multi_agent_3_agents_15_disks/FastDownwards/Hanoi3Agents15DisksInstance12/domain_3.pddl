(define (domain hanoi-3peg-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?x - place)
    (clear ?x - place)
    (can-stack ?d - disk ?x - place)
  )
  (:action move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)