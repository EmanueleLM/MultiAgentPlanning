(define (domain hanoi-3peg-10disk-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg disk - support
    agent
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg)
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
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk)
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
    )
  )
)