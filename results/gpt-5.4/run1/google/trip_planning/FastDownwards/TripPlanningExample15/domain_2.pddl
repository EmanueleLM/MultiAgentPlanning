(define (domain tripplanningexample15)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (occupies ?c - city ?d - day)
  )

  (:action start_day
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (at ?c)
      (not (occupies ?c d1))
    )
    :effect (occupies ?c d1)
  )

  (:action stay_and_advance
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (at ?c)
      (occupies ?c ?d)
      (not (occupies ?c ?d2))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (occupies ?c ?d2)
    )
  )

  (:action fly_and_advance
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (at ?from)
      (occupies ?from ?d)
      (direct ?from ?to)
      (not (occupies ?to ?d2))
      (not (at ?to))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (occupies ?to ?d2)
    )
  )
)