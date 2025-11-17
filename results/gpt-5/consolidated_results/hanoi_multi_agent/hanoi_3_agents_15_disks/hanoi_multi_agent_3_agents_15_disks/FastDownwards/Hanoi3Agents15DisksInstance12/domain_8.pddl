(define (domain hanoi-3peg-15-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    stage
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (can-stack ?d - disk ?s - support)
    (current ?t - stage)
    (next ?t - stage ?t2 - stage)
  )
  (:action move
    :parameters (?d - disk ?from - support ?to - support ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
      (not (on ?d ?to))
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