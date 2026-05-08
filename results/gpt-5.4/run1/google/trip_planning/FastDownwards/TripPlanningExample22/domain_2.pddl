(define (domain tripplanningexample22)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (at ?c - city)
    (visited_on ?c - city ?d - day)
    (last_day ?d - day)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (visited_on ?c ?d1)
      (not (visited_on ?c ?d2))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (visited_on ?from ?d1)
      (direct ?from ?to)
      (not (visited_on ?to ?d2))
      (not (at ?to))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d2)
    )
  )
)