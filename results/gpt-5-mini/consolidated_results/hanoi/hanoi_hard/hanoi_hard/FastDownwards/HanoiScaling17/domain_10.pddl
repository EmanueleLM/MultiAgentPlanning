(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)

    (top ?d - disk ?p - peg)
    (empty ?p - peg)

    (smaller ?d1 - disk ?d2 - disk)

    (different ?p1 - peg ?p2 - peg)

    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      (not (empty ?to))
      (on-peg ?d ?to)
      (top ?d ?to)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (smaller ?d ?below)
      (different ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      (on-disk ?d ?below)
      (top ?d ?to)
      (not (top ?below ?to))
      (not (empty ?to))
    )
  )

  (:action move-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)

      (not (on-peg ?d ?from))

      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?above - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?above ?to)
      (smaller ?d ?above)
      (different ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)

      (not (on-peg ?d ?from))

      (on-disk ?d ?above)
      (top ?d ?to)
      (not (top ?above ?to))
      (not (empty ?to))
    )
  )
)