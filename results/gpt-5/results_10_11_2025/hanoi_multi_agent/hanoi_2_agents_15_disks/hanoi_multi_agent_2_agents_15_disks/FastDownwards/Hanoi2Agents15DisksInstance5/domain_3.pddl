(define (domain hanoi-2agent-15-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
    time
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d - disk ?s - support)
    (can-move ?a - agent ?d - disk)
    (next ?t1 - time ?t2 - time)
    (current ?t - time)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support ?t - time ?t2 - time)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)