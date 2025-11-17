(define (domain hanoi-10-2agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    stage
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (cur ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    (turn ?t - stage ?a - agent)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move ?a ?d)
      (cur ?s)
      (next ?s ?t)
      (turn ?s ?a)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (cur ?s))
      (cur ?t)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move ?a ?d)
      (cur ?s)
      (next ?s ?t)
      (turn ?s ?a)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (cur ?s))
      (cur ?t)
    )
  )
)