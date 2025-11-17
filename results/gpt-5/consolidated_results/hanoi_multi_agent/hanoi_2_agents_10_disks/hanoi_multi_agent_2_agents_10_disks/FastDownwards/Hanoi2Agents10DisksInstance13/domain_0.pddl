(define (domain hanoi-2agent-10)
  (:requirements :strips :typing)
  (:types
    agent
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (may-move ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (may-move ?ag ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-to-disk
    :parameters (?ag - agent ?d1 - disk ?from - place ?d2 - disk)
    :precondition (and
      (may-move ?ag ?d1)
      (clear ?d1)
      (on ?d1 ?from)
      (clear ?d2)
      (smaller ?d1 ?d2)
    )
    :effect (and
      (not (on ?d1 ?from))
      (on ?d1 ?d2)
      (clear ?from)
      (not (clear ?d2))
    )
  )
)