(define (domain hanoi-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (supports-larger ?s - support ?d - disk)
    (can-move ?a - agent ?d - disk)
    (locked ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (can-move ?a ?d)
      (not (locked ?d))
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (supports-larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)