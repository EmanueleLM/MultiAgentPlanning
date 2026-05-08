(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)       ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)             ; nothing is directly on place ?p (it is the top)
    (can-be-on ?d - disk ?p - place) ; static: disk ?d may legally be placed directly on place ?p
  )

  (:action move-disk
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-be-on ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)