(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?s - disk)

    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    (smaller ?x - disk ?y - disk)

    (succ ?s1 - step ?s2 - step)
    (ready ?s - step)
    (done ?s - step)
  )

  (:action move-peg-to-peg
    :parameters (?st - step ?d - disk ?from - peg ?to - peg ?next - step)
    :precondition (and
      (ready ?st)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (succ ?st ?next)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))

      (not (ready ?st))
      (ready ?next)
      (done ?st)
    )
  )

  (:action move-peg-to-disk
    :parameters (?st - step ?d - disk ?from - peg ?to - disk ?next - step)
    :precondition (and
      (ready ?st)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (succ ?st ?next)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)
      (not (clear-disk ?to))

      (not (ready ?st))
      (ready ?next)
      (done ?st)
    )
  )

  (:action move-disk-to-peg
    :parameters (?st - step ?d - disk ?from - disk ?to - peg ?next - step)
    :precondition (and
      (ready ?st)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (succ ?st ?next)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (clear-disk ?from)
      (not (clear-peg ?to))

      (not (ready ?st))
      (ready ?next)
      (done ?st)
    )
  )

  (:action move-disk-to-disk
    :parameters (?st - step ?d - disk ?from - disk ?to - disk ?next - step)
    :precondition (and
      (ready ?st)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (succ ?st ?next)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (clear-disk ?from)
      (not (clear-disk ?to))

      (not (ready ?st))
      (ready ?next)
      (done ?st)
    )
  )
)