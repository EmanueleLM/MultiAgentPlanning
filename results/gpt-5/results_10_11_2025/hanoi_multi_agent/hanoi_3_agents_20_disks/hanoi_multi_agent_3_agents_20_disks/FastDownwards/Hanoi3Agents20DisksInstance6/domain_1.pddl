(define (domain hanoi-agents-3)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    place
    peg - place
    disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?d - disk ?x - place)
    (can-move ?a - agent ?d - disk)
  )
  (:action move
    :parameters (?a - agent ?d - disk ?from - place ?to - place)
    :precondition (and
      (can-move ?a ?d)
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