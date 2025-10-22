(define (domain hanoi-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-to-place
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-to-disk
    :parameters (?d - disk ?from - place ?t - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?t) (smaller ?d ?t))
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
    )
  )
)