(define (domain hanoi3agents10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support - object
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (allowed ?a - agent ?d - disk)
  )

  (:action to-peg
    :parameters (?a - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action to-disk
    :parameters (?a - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)