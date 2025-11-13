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
    (locked ?d - disk)
    (cur ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  (:action move_to_peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (clear ?d)
      (clear ?to)
      (on ?d ?from)
      (can_move ?a ?d)
      (not (locked ?d))
      (cur ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (cur ?t1))
      (cur ?t2)
    )
  )

  (:action move_to_disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (clear ?d)
      (clear ?to)
      (on ?d ?from)
      (can_move ?a ?d)
      (not (locked ?d))
      (smaller ?d ?to)
      (cur ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (cur ?t1))
      (cur ?t2)
    )
  )
)