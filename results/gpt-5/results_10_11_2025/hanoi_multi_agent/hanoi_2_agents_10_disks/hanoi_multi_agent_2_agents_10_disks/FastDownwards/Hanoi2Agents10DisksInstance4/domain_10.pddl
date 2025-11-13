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
    (smaller ?x - disk ?y - support)
    (cur ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    (turn ?t - stage ?a - agent)
    (can-move ?a - agent ?d - disk)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support ?s - stage ?t - stage)
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