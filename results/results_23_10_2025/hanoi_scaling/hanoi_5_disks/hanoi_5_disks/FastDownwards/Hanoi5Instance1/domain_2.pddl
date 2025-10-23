(define (domain hanoi5)
  :requirements :strips :typing :negative-preconditions
  :types disk peg

  :predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)
    (top ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d - disk ?e - disk)
  )

  (:action move-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (clear-peg ?to)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (top ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?d)
    )
  )

  (:action move-onpeg-to-disk
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
      (not (top ?t ?to))
      (on-disk ?d ?t)
      (top ?d ?to)
      (not (clear-disk ?t))
      (clear-peg ?from)
      (clear-disk ?d)
    )
  )

  (:action move-disk-to-empty
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?under)
      (clear-peg ?to)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-disk ?d ?under))
      (top ?under ?from)
      (clear-disk ?under)
      (top ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?d)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?under)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (top ?d ?from))
      (not (on-disk ?d ?under))
      (top ?under ?from)
      (clear-disk ?under)
      (not (top ?t ?to))
      (on-disk ?d ?t)
      (top ?d ?to)
      (not (clear-disk ?t))
      (clear-disk ?d)
    )
  )
)