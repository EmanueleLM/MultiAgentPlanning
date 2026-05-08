(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - peg)
    (immed-below ?upper - disk ?lower - disk)
    (has-below ?d - disk)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (current-step ?s - step)
    (next ?s1 - step ?s2 - step)
    (larger ?x - disk ?y - disk)
  )

  ;; Move a top disk from ?from to an empty destination ?to when the moved disk
  ;; has no disk immediately below it at the source (it was the only disk on the peg).
  (:action move-empty-no-below
    :parameters (?s1 - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s1)
      (next ?s1 ?s2)
      (top ?d ?from)
      (on ?d ?from)
      (empty ?to)
      (not (has-below ?d))
    )
    :effect (and
      (not (current-step ?s1))
      (current-step ?s2)

      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (empty ?from)

      (top ?d ?to)
      (not (empty ?to))

      (not (has-below ?d))
    )
  )

  ;; Move a top disk from ?from to an empty destination ?to when the moved disk
  ;; has an immediate lower disk ?l at the source (so source remains non-empty).
  (:action move-empty-with-below
    :parameters (?s1 - step ?s2 - step ?d - disk ?l - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s1)
      (next ?s1 ?s2)
      (top ?d ?from)
      (on ?d ?from)
      (empty ?to)
      (immed-below ?d ?l)
      (has-below ?d)
    )
    :effect (and
      (not (current-step ?s1))
      (current-step ?s2)

      (not (on ?d ?from))
      (on ?d ?to)

      (not (immed-below ?d ?l))
      (top ?l ?from)

      (not (top ?d ?from))
      (not (empty ?from))

      (top ?d ?to)
      (not (empty ?to))

      (not (has-below ?d))
    )
  )

  ;; Move a top disk from ?from onto a non-empty destination ?to whose top is ?e (larger than moved disk),
  ;; when the moved disk has no disk immediately below it at the source (source becomes empty).
  (:action move-nonempty-no-below
    :parameters (?s1 - step ?s2 - step ?d - disk ?e - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s1)
      (next ?s1 ?s2)
      (top ?d ?from)
      (on ?d ?from)
      (top ?e ?to)
      (on ?e ?to)
      (larger ?e ?d)
      (not (has-below ?d))
    )
    :effect (and
      (not (current-step ?s1))
      (current-step ?s2)

      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (empty ?from)

      (not (top ?e ?to))
      (top ?d ?to)

      (immed-below ?d ?e)
      (has-below ?d)
    )
  )

  ;; Move a top disk from ?from onto a non-empty destination ?to whose top is ?e (larger than moved disk),
  ;; when the moved disk has an immediate lower disk ?l at the source (source remains non-empty).
  (:action move-nonempty-with-below
    :parameters (?s1 - step ?s2 - step ?d - disk ?l - disk ?e - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s1)
      (next ?s1 ?s2)
      (top ?d ?from)
      (on ?d ?from)
      (immed-below ?d ?l)
      (has-below ?d)
      (top ?e ?to)
      (on ?e ?to)
      (larger ?e ?d)
    )
    :effect (and
      (not (current-step ?s1))
      (current-step ?s2)

      (not (on ?d ?from))
      (on ?d ?to)

      (not (immed-below ?d ?l))
      (top ?l ?from)
      (not (top ?d ?from))
      (not (empty ?from))

      (not (top ?e ?to))
      (top ?d ?to)
      (immed-below ?d ?e)
      (has-below ?d)
    )
  )
)