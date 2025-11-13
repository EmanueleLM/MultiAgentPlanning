(define (domain hanoi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    loc
    agent
    peg disk - loc
  )
  (:predicates
    (on ?d - disk ?x - loc)
    (clear ?x - loc)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - loc ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - loc ?to - disk)
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
      (clear ?d)
    )
  )
)