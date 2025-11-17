(define (domain hanoi-3agents-20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on ?d - disk ?b - (either disk peg))
    (clear ?o - (either disk peg))
    (can-move ?a - agent ?d - disk)
    (bigger ?x - (either disk peg) ?y - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - (either disk peg) ?to - (either disk peg))
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (bigger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)