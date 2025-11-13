(define (domain hanoi2agents15)
  (:requirements :strips :typing)
  (:types
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (can-stack ?d - disk ?s - support)
    (allowed1 ?d - disk)
    (allowed2 ?d - disk)
  )

  (:action move-agent1
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (allowed1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent2
    :parameters (?d - disk ?from - support ?to - support)
    :precondition (and
      (allowed2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)