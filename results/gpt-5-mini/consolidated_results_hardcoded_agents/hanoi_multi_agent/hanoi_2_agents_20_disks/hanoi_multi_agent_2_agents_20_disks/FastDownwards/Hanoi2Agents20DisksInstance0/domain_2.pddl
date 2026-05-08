(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (above ?u - disk ?l - disk)
    (top ?d - disk ?p - peg)
    (smaller ?x - disk ?y - disk)
    (is-small ?d - disk)
    (is-large ?d - disk)
  )

  (:action agent_1-move
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (is-small ?d)
      (top ?d ?from)
      (above ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (top ?below ?from)
      (not (top ?t ?to))
      (top ?d ?to)
      (not (above ?d ?below))
      (above ?d ?t)
    )
  )

  (:action agent_2-move
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (is-large ?d)
      (top ?d ?from)
      (above ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (top ?below ?from)
      (not (top ?t ?to))
      (top ?d ?to)
      (not (above ?d ?below))
      (above ?d ?t)
    )
  )
)