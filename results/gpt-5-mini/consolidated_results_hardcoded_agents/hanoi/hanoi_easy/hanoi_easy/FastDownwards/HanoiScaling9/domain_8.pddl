(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (is-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)

    (on-disk ?d - disk ?below - disk)
    (on-peg ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)

    (smaller ?d1 - disk ?d2 - disk)
    (different ?p1 - peg ?p2 - peg)
  )

  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?t - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (top ?t ?to)
      (smaller ?d ?t)

      (different ?from ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      (not (top ?d ?from))
      (not (on-disk ?d ?below))
      (top ?below ?from)

      (not (top ?t ?to))
      (on-disk ?d ?t)
      (top ?d ?to)

      (not (empty ?to))
    )
  )

  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      (not (top ?d ?from))
      (not (on-disk ?d ?below))
      (top ?below ?from)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (top ?t ?to)
      (smaller ?d ?t)

      (different ?from ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (empty ?from)

      (not (top ?t ?to))
      (on-disk ?d ?t)
      (top ?d ?to)

      (not (empty ?to))
    )
  )

  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (empty ?from)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )
)