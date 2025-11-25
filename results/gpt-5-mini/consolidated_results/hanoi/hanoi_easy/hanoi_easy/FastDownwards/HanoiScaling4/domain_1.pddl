(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - (either disk peg))
    (clear ?p - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
    (at-step ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)