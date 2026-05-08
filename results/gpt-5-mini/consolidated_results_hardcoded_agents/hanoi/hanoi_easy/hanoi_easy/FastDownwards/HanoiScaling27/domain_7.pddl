(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)

    (clear-disk ?d - disk)
    (clear-peg ?p - peg)

    (smaller ?d1 - disk ?d2 - disk)

    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-peg ?d ?from)
      (clear-disk ?d)

      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-peg ?from)

      (clear-disk ?d)

      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

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

      (clear-disk ?d)

      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

      (on-disk ?d ?from)
      (clear-disk ?d)

      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-disk ?from)

      (clear-disk ?d)

      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)

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

      (clear-disk ?d)

      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)