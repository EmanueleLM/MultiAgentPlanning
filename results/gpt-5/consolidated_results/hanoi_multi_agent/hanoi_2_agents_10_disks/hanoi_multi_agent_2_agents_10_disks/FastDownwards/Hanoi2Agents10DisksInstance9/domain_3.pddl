(define (domain hanoi-two-agent-10)
  (:requirements :strips :typing)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (larger ?s - support ?d - disk)
    (can-move ?a - agent ?d - disk)
  )
  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)