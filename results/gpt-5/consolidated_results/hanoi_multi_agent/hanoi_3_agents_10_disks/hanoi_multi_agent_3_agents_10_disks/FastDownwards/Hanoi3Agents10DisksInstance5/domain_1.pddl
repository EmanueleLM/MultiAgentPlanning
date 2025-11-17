(define (domain hanoi3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (controls ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (controls ?a ?d)
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

  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (controls ?a ?d)
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