(define (domain hanoi-2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    (on ?x - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (allowed ?x - disk ?a - agent)
  )

  (:action move-to-peg
    :parameters (?a - agent ?x - disk ?from - support ?to - peg)
    :precondition (and
      (allowed ?x ?a)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?x - disk ?from - support ?to - disk)
    :precondition (and
      (allowed ?x ?a)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)