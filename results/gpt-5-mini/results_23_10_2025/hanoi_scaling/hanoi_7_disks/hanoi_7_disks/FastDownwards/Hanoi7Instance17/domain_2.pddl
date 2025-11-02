(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?s - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?a - disk ?b - disk)
    (agent-of ?ag - agent ?p - peg)
  )

  (:action move-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (agent-of ?ag ?from)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (agent-of ?ag ?from)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  (:action move-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (agent-of ?ag ?from)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move-disk-to-disk
    :parameters (?ag - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (agent-of ?ag ?from)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )
)