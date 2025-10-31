(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk place)
  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (smaller ?x - disk ?y - disk)
  )

  (:action move-to-empty-peg
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move-onto-disk
    :parameters (?d - disk ?from - object ?t - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
    )
  )
)