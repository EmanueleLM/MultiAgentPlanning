(define (domain hanoi-two-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    peg - obj
    disk - obj
    agent
  )
  (:predicates
    (on ?d - disk ?o - obj)
    (clear ?o - obj)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - obj ?to - peg)
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
    )
  )

  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - obj ?to - disk)
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
    )
  )
)