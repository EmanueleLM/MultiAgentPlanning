(define (domain hanoi-single)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?x - (either disk peg))
    (clear ?x - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
    (placeable ?d - disk ?x - (either disk peg))
  )

  (:action move
    :parameters (?d - disk ?from - (either disk peg) ?to - (either disk peg))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (placeable ?d ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))))
)