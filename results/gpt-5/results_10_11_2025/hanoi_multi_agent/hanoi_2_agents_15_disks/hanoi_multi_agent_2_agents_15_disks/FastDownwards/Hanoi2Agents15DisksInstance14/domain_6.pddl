(define (domain hanoi2agents15_staged_strict)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg - support
    disk - support
    time
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (can-stack ?d - disk ?s - support)
    (allowed1 ?d - disk)
    (allowed2 ?d - disk)
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  (:action move-agent1
    :parameters (?d - disk ?from - support ?to - support ?t - time ?t2 - time)
    :precondition (and
      (allowed1 ?d)
      (on ?d ?from)
      (not (on ?d ?to))
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action move-agent2
    :parameters (?d - disk ?from - support ?to - support ?t - time ?t2 - time)
    :precondition (and
      (allowed2 ?d)
      (on ?d ?from)
      (not (on ?d ?to))
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?t))
      (current ?t2)
    )
  )
)