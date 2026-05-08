(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?u - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (at ?d - disk ?p - peg)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at ?d ?from)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))

      (not (at ?d ?from))
      (at ?d ?to)

      (clear-disk ?d)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (at ?d ?from)
      (at ?to ?topeg)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)

      (not (at ?d ?from))
      (at ?d ?topeg)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?frompeg - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?to)
      (at ?d ?frompeg)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?under))
      (clear-disk ?under)

      (on-peg ?d ?to)
      (not (clear-peg ?to))

      (not (at ?d ?frompeg))
      (at ?d ?to)

      (clear-disk ?d)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?to - disk ?frompeg - peg ?topeg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (at ?d ?frompeg)
      (at ?to ?topeg)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?under))
      (clear-disk ?under)

      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?d)

      (not (at ?d ?frompeg))
      (at ?d ?topeg)
    )
  )
)