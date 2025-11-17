(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg - support
    disk - support
    disk_a1 - disk
    disk_a2 - disk
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (fits ?d - disk ?s - support)
  )

  (:action move_agent_1
    :parameters (?d - disk_a1 ?from - support ?to - support)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (fits ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move_agent_2
    :parameters (?d - disk_a2 ?from - support ?to - support)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (fits ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)