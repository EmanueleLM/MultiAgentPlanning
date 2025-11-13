(define (domain tripplanningexample1)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)
    (today ?d - day)
    (next ?d - day ?d2 - day)
    (needs_city ?c - city ?d - day)
    (allowed ?from - city ?to - city)
  )

  (:action move
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at ?from)
      (today ?d)
      (allowed ?from ?to)
      (needs_city ?to ?d)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action tick
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (today ?d)
      (next ?d ?d2)
      (needs_city ?c ?d)
    )
    :effect (and
      (not (needs_city ?c ?d))
      (not (today ?d))
      (today ?d2)
    )
  )
)