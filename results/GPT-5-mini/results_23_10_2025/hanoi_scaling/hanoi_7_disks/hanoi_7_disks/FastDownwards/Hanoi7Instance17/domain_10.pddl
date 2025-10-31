(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object
          disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)              ; place ?p has nothing directly on it (top is clear)
    (smaller ?a - disk ?b - disk)   ; disk ?a is smaller than disk ?b
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?t - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
    )
  )
)