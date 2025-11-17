(define (domain hanoi-agents-3peg-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg disk - support
  )

  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (permitted ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (permitted ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (permitted ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (permitted ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (permitted ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
    )
  )
)