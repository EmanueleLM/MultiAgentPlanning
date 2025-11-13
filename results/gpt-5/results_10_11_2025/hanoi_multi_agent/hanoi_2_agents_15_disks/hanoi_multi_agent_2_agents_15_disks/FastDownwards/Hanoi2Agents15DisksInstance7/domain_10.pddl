(define (domain hanoi2agents15disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
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
  )

  (:action move-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?u - support ?a - agent)
    :precondition (and
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
    )
  )

  (:action move-onto
    :parameters (?d - disk ?from - peg ?to - peg ?u - support ?v - disk ?a - agent)
    :precondition (and
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
    )
  )
)