(define (domain hanoi-two-agent-10)
  (:requirements :strips :typing)
  (:types agent place peg disk)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (larger ?p - place ?d - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - place ?to - place)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)