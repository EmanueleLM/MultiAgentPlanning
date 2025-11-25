(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?support - disk)

    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    (smaller ?d1 ?d2 - disk)

    (current-step ?s - step)
    (succ ?s1 ?s2 - step)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains top
      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
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

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (clear-disk ?from)

      (not (clear-peg ?to))

      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?snext - step)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (clear-disk ?from)
      (not (clear-disk ?to))

      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)