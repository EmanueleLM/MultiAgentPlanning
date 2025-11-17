(define (domain hanoi-3agents-20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    (on ?d - disk ?b - place)
    (clear ?o - place)
    (can-move ?a - agent ?d - disk)
    (bigger ?x - place ?y - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - place ?to - place)
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