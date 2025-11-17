(define (domain hanoi2agents15disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    stage
    support
    disk - support
    peg - support
  )
  (:predicates
    (on ?d - disk ?p - peg)
    (on-direct ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (allowed ?a - agent ?d - disk)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
    (stage-allowed-empty ?t - stage ?d - disk ?from - peg ?to - peg)
    (stage-allowed-onto ?t - stage ?d - disk ?from - peg ?to - peg ?u - disk)
  )

  (:action stage-move-to-empty
    :parameters (?t - stage ?t2 - stage ?d - disk ?u - support ?from - peg ?to - peg ?a - agent)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (stage-allowed-empty ?t ?d ?from ?to)
      (allowed ?a ?d)
      (on ?d ?from)
      (on-direct ?d ?u)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (on-direct ?d ?u))
      (on-direct ?d ?to)
      (clear ?u)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action stage-move-onto
    :parameters (?t - stage ?t2 - stage ?d - disk ?u - support ?from - peg ?to - peg ?v - disk ?a - agent)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (stage-allowed-onto ?t ?d ?from ?to ?v)
      (allowed ?a ?d)
      (on ?d ?from)
      (on-direct ?d ?u)
      (clear ?d)
      (on ?v ?to)
      (clear ?v)
      (smaller ?d ?v)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (on-direct ?d ?u))
      (on-direct ?d ?v)
      (clear ?u)
      (not (clear ?v))
      (not (current ?t))
      (current ?t2)
    )
  )
)