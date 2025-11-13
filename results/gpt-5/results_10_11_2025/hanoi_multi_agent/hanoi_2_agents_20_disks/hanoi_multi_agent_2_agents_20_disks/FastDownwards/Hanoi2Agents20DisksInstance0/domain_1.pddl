(define (domain hanoi-two-agent)
  (:requirements :strips :typing)
  (:types
    place
    disk peg - place
    agent
  )
  (:predicates
    (on ?d - disk ?s - place)
    (clear ?s - place)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
    )
  )
)