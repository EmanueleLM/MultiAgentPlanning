(define (domain hanoi-with-agents-stepped)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg disk - support
    step
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (allowed ?a - agent ?d - disk)
    (larger ?x - disk ?y - disk)
    (next ?t - step ?t2 - step)
    (now ?t - step)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (now ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?t - step ?t2 - step)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (now ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (now ?t))
      (now ?t2)
    )
  )
)