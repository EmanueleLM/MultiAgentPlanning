(define (domain hanoi-3peg-15-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place agent
    disk peg - place
  )
  (:predicates
    (on ?d - disk ?x - place)
    (clear ?x - place)
    (can-stack ?d - disk ?x - place)
    (controls ?a - agent ?d - disk)
  )
  (:action move
    :parameters (?a - agent ?d - disk ?from - place ?to - place)
    :precondition (and
      (controls ?a ?d)
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