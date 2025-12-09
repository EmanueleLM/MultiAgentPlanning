(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?b - disk)
    (top ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)

    (next ?s1 - stage ?s2 - stage)
    (used-stage ?s - stage)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (used-stage ?s)
      (next ?s ?s2)
      (top ?d)
      (on-peg ?d ?from)
      (empty ?to)
      (not (used-stage ?s2))
    )
    :effect (and
      (not (used-stage ?s))
      (used-stage ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (empty ?to))
      (empty ?from)

      (top ?d)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (used-stage ?s)
      (next ?s ?s2)
      (top ?d)
      (on-disk ?d ?below)
      (empty ?to)
      (not (used-stage ?s2))
    )
    :effect (and
      (not (used-stage ?s))
      (used-stage ?s2)

      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (empty ?to))

      (top ?d)
      (top ?below)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?v - disk ?s - stage ?s2 - stage)
    :precondition (and
      (used-stage ?s)
      (next ?s ?s2)
      (top ?d)
      (on-peg ?d ?from)
      (top ?v)
      (smaller ?d ?v)
      (not (used-stage ?s2))
    )
    :effect (and
      (not (used-stage ?s))
      (used-stage ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?v)

      (empty ?from)

      (not (top ?v))
      (top ?d)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?v - disk ?s - stage ?s2 - stage)
    :precondition (and
      (used-stage ?s)
      (next ?s ?s2)
      (top ?d)
      (on-disk ?d ?below)
      (top ?v)
      (smaller ?d ?v)
      (not (used-stage ?s2))
    )
    :effect (and
      (not (used-stage ?s))
      (used-stage ?s2)

      (not (on-disk ?d ?below))
      (on-disk ?d ?v)

      (top ?d)
      (top ?below)
      (not (top ?v))
    )
  )
)