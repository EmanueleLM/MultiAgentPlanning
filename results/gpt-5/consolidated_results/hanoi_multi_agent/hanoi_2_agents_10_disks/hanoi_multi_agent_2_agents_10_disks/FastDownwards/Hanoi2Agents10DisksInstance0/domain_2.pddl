(define (domain hanoi-two-agent-staged)
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
    (controls ?a - agent ?d - disk)
    (at ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (controls ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?t1))
      (at ?t2)
    )
  )

  (:action move-onto-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (controls ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?t1))
      (at ?t2)
    )
  )
)