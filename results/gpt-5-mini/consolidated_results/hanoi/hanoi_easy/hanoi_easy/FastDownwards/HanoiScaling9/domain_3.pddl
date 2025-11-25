(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    disk peg stage - object
  )

  (:predicates
    (on ?d - disk ?x - object)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (stage ?s - stage)
    (next ?s - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      (not (top ?d ?from))
      (not (on ?d ?below))

      (on ?d ?t)
      (top ?d ?to)
      (not (top ?t ?to))

      (top ?below ?from)
    )
  )

  (:action move-disk-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      (not (top ?d ?from))
      (not (on ?d ?below))

      (on ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      (top ?below ?from)
    )
  )

  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      (not (top ?d ?from))
      (not (on ?d ?from))

      (on ?d ?t)
      (top ?d ?to)
      (not (top ?t ?to))

      (empty ?from)
    )
  )

  (:action move-disk-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)

      (not (top ?d ?from))
      (not (on ?d ?from))

      (on ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      (empty ?from)
    )
  )
)