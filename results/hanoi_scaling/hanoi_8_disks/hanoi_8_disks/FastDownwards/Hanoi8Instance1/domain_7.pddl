(define (domain tower-of-hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on-disk ?d - disk ?below - disk)
    (on-peg ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (top ?below ?from)
    )
  )

  (:action move-peg-to-onto
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)
      (not (top ?t ?to))
      (top ?d ?to)
      (empty ?from)
    )
  )

  (:action move-disk-to-onto
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)
      (not (top ?t ?to))
      (top ?d ?to)
      (top ?below ?from)
    )
  )
)