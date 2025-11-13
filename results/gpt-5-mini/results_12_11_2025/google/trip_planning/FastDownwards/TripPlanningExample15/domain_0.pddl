(define (domain travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (adjacent ?c1 - city ?c2 - city)
  )

  ;; Stay in the same city from one day to the next (consecutive days only).
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  ;; Fly between adjacent cities from one day to the next (consecutive days only).
  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (adjacent ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
    )
  )
)