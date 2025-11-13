(define (domain hanoi3agents_staged)
  (:requirements :strips :typing)
  (:types
    agent
    stage
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?d1 - disk ?d2 - disk)
    (controls ?a - agent ?d - disk)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    (allowed ?d - disk ?from - support ?to - support ?t - stage)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (next ?t ?t2)
      (allowed ?d ?from ?to ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?t)
      (next ?t ?t2)
      (allowed ?d ?from ?to ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )
)