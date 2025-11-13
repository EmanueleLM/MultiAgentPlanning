(define (domain two-agent-hanoi-20)
  (:requirements :strips :typing :action-costs)
  (:types
    agent
    place
    disk peg - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )
  (:functions
    (total-cost)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move ?ag ?d)
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
      (increase (total-cost) 1)
    )
  )
)