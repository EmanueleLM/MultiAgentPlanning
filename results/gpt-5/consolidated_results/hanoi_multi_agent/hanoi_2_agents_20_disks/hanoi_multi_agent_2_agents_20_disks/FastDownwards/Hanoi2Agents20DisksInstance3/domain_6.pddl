(define (domain hanoi2agents_staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent stage
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (allowed ?a - agent ?d - disk)
    (cur ?st - stage)
    (succ ?st1 - stage ?st2 - stage)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (cur ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (cur ?s))
      (cur ?s2)
    )
  )

  (:action move-onto-disk
    :parameters (?ag - agent ?d - disk ?from - support ?under - disk ?s - stage ?s2 - stage)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?under)
      (smaller ?d ?under)
      (cur ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?under)
      (clear ?from)
      (not (clear ?under))
      (not (cur ?s))
      (cur ?s2)
    )
  )
)