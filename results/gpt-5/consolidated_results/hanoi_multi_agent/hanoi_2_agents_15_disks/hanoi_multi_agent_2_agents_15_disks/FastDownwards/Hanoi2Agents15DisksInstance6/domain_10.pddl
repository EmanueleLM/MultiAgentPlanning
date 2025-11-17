(define (domain hanoi-two-agent-15-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
    stage
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (can_move ?a - agent ?d - disk)
    (at ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move_to_peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (clear ?d)
      (clear ?to)
      (on ?d ?from)
      (can_move ?a ?d)
      (at ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?t))
      (at ?t2)
    )
  )

  (:action move_to_disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (clear ?d)
      (clear ?to)
      (on ?d ?from)
      (can_move ?a ?d)
      (smaller ?d ?to)
      (at ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?t))
      (at ?t2)
    )
  )
)