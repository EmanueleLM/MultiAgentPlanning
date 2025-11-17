(define (domain two-agent-hanoi-permissions)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (smaller ?d1 - disk ?d2 - disk)
    (clear ?x - support)
    (on ?d - disk ?x - support)
    (assigned ?a - agent ?d - disk)
  )

  ; Move a clear disk from a peg to a different clear peg
  (:action move-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (assigned ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a clear disk from a peg onto a larger clear disk
  (:action move-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (assigned ?a ?d)
      (clear ?d)
      (on ?d ?from)
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

  ; Move a clear disk from a disk to a clear peg
  (:action move-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (assigned ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Move a clear disk from a disk onto a larger clear disk
  (:action move-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (assigned ?a ?d)
      (clear ?d)
      (on ?d ?from)
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