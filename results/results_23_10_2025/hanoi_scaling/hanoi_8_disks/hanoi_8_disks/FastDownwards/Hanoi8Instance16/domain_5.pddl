(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?under - disk)
    (on-peg  ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
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
    :parameters (?d - disk ?from - peg ?t - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)
      (clear-peg ?from)
      (not (clear-disk ?t))
      (clear-disk ?d)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?s - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?s)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-peg ?d ?to)
      (clear-disk ?s)
      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?s - disk ?t - disk)
    :precondition (and
      (on-disk ?d ?s)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-disk ?d ?t)
      (clear-disk ?s)
      (not (clear-disk ?t))
      (clear-disk ?d)
    )
  )
)