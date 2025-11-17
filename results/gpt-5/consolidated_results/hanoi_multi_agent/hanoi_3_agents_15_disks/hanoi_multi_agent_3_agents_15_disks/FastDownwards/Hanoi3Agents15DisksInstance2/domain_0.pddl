(define (domain hanoi-3-agent-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg agent
  )
  (:predicates
    (on ?d1 - disk ?d2 - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?x - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
    (top ?p - peg ?d - disk)
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
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

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?p - peg)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on-peg ?d ?p)
      (clear ?from)
      (not (clear ?p))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p - peg ?to - disk)
    :precondition (and
      (allowed ?a ?d)
      (on-peg ?d ?p)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on ?d ?to)
      (clear ?p)
      (not (clear ?to))
    )
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p-from - peg ?p-to - peg)
    :precondition (and
      (allowed ?a ?d)
      (on-peg ?d ?p-from)
      (clear ?d)
      (clear ?p-to)
    )
    :effect (and
      (not (on-peg ?d ?p-from))
      (on-peg ?d ?p-to)
      (clear ?p-from)
      (not (clear ?p-to))
    )
  )
)