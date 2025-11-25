(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)
  (:predicates
    (on ?d - disk ?s - (either disk peg))
    (clear ?s - (either disk peg))
    (can-place ?d - disk ?s - (either disk peg))
  )

  (:action move
    :parameters (?actor - agent ?d - disk ?from - (either disk peg) ?to - (either disk peg))
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)