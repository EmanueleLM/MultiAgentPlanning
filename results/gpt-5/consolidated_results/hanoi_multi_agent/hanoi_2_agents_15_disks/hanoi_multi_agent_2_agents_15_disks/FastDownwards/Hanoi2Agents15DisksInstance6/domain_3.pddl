(define (domain hanoi-two-agent-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (can_move ?a - agent ?d - disk)
  )

  (:action move_to_peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (clear ?d)
      (clear ?to)
      (on ?d ?from)
      (can_move ?a ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_to_disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (clear ?d)
      (clear ?to)
      (on ?d ?from)
      (can_move ?a ?d)
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