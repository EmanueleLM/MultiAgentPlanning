(define (domain hanoi-6disk-steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?s - disk)
    (top ?d - disk)
    (empty ?p - peg)
    (in ?d - disk ?p - peg)
    (smaller ?a - disk ?b - disk)
    (next ?s - step ?s2 - step)
    (current ?s - step)
    (diff ?p - peg ?q - peg)
  )

  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (top ?d)
      (in ?d ?from)
      (empty ?to)
      (diff ?from ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (in ?d ?from))
      (in ?d ?to)

      (empty ?from)
      (not (empty ?to))

      (top ?d)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?topeg - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
      (in ?d ?from)
      (in ?to ?topeg)
      (diff ?from ?topeg)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (not (in ?d ?from))
      (in ?d ?topeg)

      (empty ?from)
      (not (empty ?topeg))

      (not (top ?to))
      (top ?d)
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?d - disk ?below - disk ?frompeg - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)
      (top ?d)
      (in ?d ?frompeg)
      (in ?below ?frompeg)
      (empty ?to)
      (diff ?frompeg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (in ?d ?frompeg))
      (in ?d ?to)

      (not (empty ?to))

      (top ?below)
      (top ?d)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?to - disk ?topeg - peg ?frompeg - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?below)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
      (in ?d ?frompeg)
      (in ?below ?frompeg)
      (in ?to ?topeg)
      (diff ?frompeg ?topeg)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      (not (in ?d ?frompeg))
      (in ?d ?topeg)

      (not (empty ?topeg))

      (not (top ?to))
      (top ?d)
      (top ?below)
    )
  )
)