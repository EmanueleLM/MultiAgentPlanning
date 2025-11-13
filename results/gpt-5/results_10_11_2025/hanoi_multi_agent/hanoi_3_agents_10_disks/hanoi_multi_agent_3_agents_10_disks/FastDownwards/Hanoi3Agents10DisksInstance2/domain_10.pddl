(define (domain hanoi3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (can-move ?a - agent ?d - disk)
    (smaller ?x - disk ?y - disk)
    (on ?d - disk ?s - support)
    (clear ?s - support)
  )
  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
    )
  )
  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
    )
  )
)