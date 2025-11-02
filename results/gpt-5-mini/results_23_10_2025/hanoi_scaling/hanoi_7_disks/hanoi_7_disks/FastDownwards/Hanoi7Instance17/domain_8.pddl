(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (smaller ?a - disk ?b - disk)
  )

  (:action move-onto-object
    :parameters (?d - disk ?from - object ?to - object)
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
    :parameters (?d - disk ?from - object ?t - disk ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (on ?t ?to)
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