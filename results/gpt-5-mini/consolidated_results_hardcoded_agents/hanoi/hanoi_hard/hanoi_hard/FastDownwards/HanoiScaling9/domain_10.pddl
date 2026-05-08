(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - place
    place
    step
  )

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?a - disk ?b - disk)
    (at-step ?s - step)
    (succ ?s - step ?s2 - step)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?snext - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?snext)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-step ?s))
      (at-step ?snext)
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?snext - step)
    :precondition (and
      (at-step ?s)
      (succ ?s ?snext)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-step ?s))
      (at-step ?snext)
    )
  )
)