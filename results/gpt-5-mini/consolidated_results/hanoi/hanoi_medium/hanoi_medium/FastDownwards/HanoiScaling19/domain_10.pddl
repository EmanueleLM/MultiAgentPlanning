(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?u - disk)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (current ?s1))
      (current ?s2)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (not (current ?s1))
      (current ?s2)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (not (current ?s1))
      (current ?s2)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (succ ?s1 ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (not (current ?s1))
      (current ?s2)
    )
  )
)