(define (domain hanoi-10-2agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    disk peg - support
    stage
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (cur ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (cur ?s)
      (next ?s ?t)
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
    :parameters (?d - disk ?from - support ?to - disk ?s - stage ?t - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (cur ?s)
      (next ?s ?t)
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