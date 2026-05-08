(define (domain tripplanningexample22)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited_on ?c - city ?d - day)
  )

  (:action stay
    :parameters (?from_day - day ?to_day - day ?c - city)
    :precondition (and
      (current_day ?from_day)
      (next ?from_day ?to_day)
      (at ?c)
      (not (visited_on ?c ?to_day))
    )
    :effect (and
      (not (current_day ?from_day))
      (current_day ?to_day)
      (visited_on ?c ?to_day)
    )
  )

  (:action fly
    :parameters (?from_day - day ?to_day - day ?from - city ?to - city)
    :precondition (and
      (current_day ?from_day)
      (next ?from_day ?to_day)
      (at ?from)
      (direct ?from ?to)
      (not (visited_on ?to ?to_day))
      (not (at ?to))
    )
    :effect (and
      (not (current_day ?from_day))
      (current_day ?to_day)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?to_day)
    )
  )
)