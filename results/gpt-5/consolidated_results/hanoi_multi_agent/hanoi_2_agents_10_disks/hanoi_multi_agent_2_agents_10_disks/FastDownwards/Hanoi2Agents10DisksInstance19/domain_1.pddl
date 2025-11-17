(define (domain hanoi-2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)
  (:predicates
    (on ?d - disk ?x - (either disk peg))
    (clear ?x - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
    (placeable ?d - disk ?x - (either disk peg))
    (allowed ?a - agent ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - (either disk peg) ?to - (either disk peg))
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (placeable ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)