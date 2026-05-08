(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - (either disk peg))
    (clear ?p - (either disk peg))
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )
)