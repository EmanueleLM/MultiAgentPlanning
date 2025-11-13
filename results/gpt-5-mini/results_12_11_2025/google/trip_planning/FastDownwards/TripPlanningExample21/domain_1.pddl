(define (domain travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (visited ?c - city)
    (free ?d - day)
  )

  ;; Fly between different cities from one day to the next, only if a direct flight exists.
  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (free ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (free ?d2))
      (at ?d2 ?to)
      (visited ?to)
    )
  )

  ;; Stay in the same city across a day boundary (no flight required).
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (free ?d2)
    )
    :effect (and
      (not (free ?d2))
      (at ?d2 ?c)
      (visited ?c)
    )
  )
)