(define (domain hanoi-agents-single-move)
  (:requirements :strips :typing)
  (:types
    agent
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?x - disk ?y - place)
    (allowed ?a - agent ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - place ?to - place)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (not (on ?d ?from))
      (not (clear ?to))
    )
  )
)