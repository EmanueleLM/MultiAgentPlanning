(define (domain hanoi-two-agent-20-staged)
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
    (larger ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
    (at ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move_to_peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action move_to_disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?s - stage ?t - stage)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (at ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?t)
    )
  )
)