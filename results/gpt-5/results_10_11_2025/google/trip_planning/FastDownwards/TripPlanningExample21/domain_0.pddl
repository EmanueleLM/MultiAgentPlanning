(define (domain trip10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day
  )
  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
    (progressed ?d - day)
  )

  (:action move
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (next ?d ?d2)
      (at ?d ?from)
      (direct ?from ?to)
      (not (progressed ?d))
    )
    :effect (and
      (at ?d2 ?to)
      (visited ?to)
      (progressed ?d)
    )
  )
)