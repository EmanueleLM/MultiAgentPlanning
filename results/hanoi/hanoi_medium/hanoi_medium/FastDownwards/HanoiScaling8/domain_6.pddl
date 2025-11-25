(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - peg)
    (top ?p - peg ?d - disk)
    (above ?d - disk ?below - disk)
    (bottom ?p - peg ?d - disk)
    (empty ?p - peg)
    (larger ?x - disk ?y - disk)
    (step-current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  (:action move-with-below-to-top
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (top ?from ?d)
      (above ?d ?below)
      (on ?below ?from)
      (top ?to ?t)
      (on ?t ?to)
      (larger ?t ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?from ?d))
      (top ?from ?below)

      (not (top ?to ?t))
      (top ?to ?d)

      (not (above ?d ?below))
      (above ?d ?t)

      (not (step-current ?s))
      (step-current ?s2)

      (not (empty ?to))
    )
  )

  (:action move-with-below-to-empty
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (top ?from ?d)
      (above ?d ?below)
      (on ?below ?from)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?from ?d))
      (top ?from ?below)

      (not (above ?d ?below))

      (top ?to ?d)
      (bottom ?to ?d)
      (not (empty ?to))

      (not (step-current ?s))
      (step-current ?s2)
    )
  )

  (:action move-only-to-top
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (top ?from ?d)
      (bottom ?from ?d)
      (top ?to ?t)
      (on ?t ?to)
      (larger ?t ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)

      (not (top ?to ?t))
      (top ?to ?d)
      (above ?d ?t)

      (not (step-current ?s))
      (step-current ?s2)

      (not (empty ?to))
    )
  )

  (:action move-only-to-empty
    :parameters (?s - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (step-current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (top ?from ?d)
      (bottom ?from ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?from ?d))
      (not (bottom ?from ?d))
      (empty ?from)

      (top ?to ?d)
      (bottom ?to ?d)
      (not (empty ?to))

      (not (step-current ?s))
      (step-current ?s2)
    )
  )
)