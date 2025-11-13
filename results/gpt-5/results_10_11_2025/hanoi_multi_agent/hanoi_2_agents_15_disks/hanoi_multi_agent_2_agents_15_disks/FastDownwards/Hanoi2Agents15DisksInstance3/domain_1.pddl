(define (domain Hanoi2Agents15Disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk agent)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed-agent-disk ?a - agent ?d - disk)
    (top ?d - disk ?p - peg)
  )

  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?d - disk ?under - disk ?to - peg)
    :precondition (and
      (allowed-agent-disk ?ag ?d)
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)
      (clear-disk ?under)
      (not (clear-peg ?to))
    )
  )

  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (allowed-agent-disk ?ag ?d)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?under - disk ?to-disk - disk)
    :precondition (and
      (allowed-agent-disk ?ag ?d)
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?to-disk)
      (smaller ?d ?to-disk)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?to-disk)
      (clear-disk ?under)
      (not (clear-disk ?to-disk))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to-disk - disk)
    :precondition (and
      (allowed-agent-disk ?ag ?d)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to-disk)
      (smaller ?d ?to-disk)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to-disk)
      (clear-peg ?from)
      (not (clear-disk ?to-disk))
    )
  )
)