(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk step)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?dd - disk)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (current ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current ?s)
      (succ ?s ?snext)
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?snext)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current ?s)
      (succ ?s ?snext)
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (current ?s))
      (current ?snext)

      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))

      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current ?s)
      (succ ?s ?snext)
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?snext)

      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      (top ?below ?from)

      (not (empty ?to))
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?t - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current ?s)
      (succ ?s ?snext)
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (current ?s))
      (current ?snext)

      (not (on-disk ?d ?below))
      (on-disk ?d ?t)

      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))

      (top ?below ?from)

      (not (empty ?to))
    )
  )
)