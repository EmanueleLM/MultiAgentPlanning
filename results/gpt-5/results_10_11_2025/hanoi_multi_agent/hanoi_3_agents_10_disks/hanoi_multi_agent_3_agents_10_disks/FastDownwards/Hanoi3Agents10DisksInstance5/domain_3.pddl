(define (domain hanoi3agents_staged)
  (:requirements :strips :typing :negative-preconditions)
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
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (allowed-to-peg ?s - stage ?d - disk ?p - peg)
    (allowed-onto-disk ?s - stage ?d - disk ?u - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
      (current ?s)
      (next ?s ?t)
      (allowed-to-peg ?s ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?t)
    )
  )

  (:action move-onto-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk ?s - stage ?t - stage)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
      (current ?s)
      (next ?s ?t)
      (allowed-onto-disk ?s ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?t)
    )
  )
)