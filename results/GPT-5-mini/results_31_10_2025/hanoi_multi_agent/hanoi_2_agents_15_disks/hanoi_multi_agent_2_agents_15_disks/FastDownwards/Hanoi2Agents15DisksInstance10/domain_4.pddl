(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
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
    :parameters (?d - disk ?from - place ?to - disk)
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
    :parameters (?d - disk ?from - place ?to - peg)
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
    :parameters (?d - disk ?from - place ?to - disk)
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