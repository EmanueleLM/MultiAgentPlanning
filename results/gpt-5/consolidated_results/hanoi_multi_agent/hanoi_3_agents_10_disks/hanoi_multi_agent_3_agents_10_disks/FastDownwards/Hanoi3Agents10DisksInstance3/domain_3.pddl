(define (domain hanoi3agents10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?x - support)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
    (ok-target ?d - disk ?to - support)
  )
  (:action move
    :parameters (?a - agent ?d - disk ?from - support ?to - support)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (ok-target ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)