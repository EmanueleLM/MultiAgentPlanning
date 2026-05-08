(define (domain tripplanningexample15)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?nd)
      (not (visited ?c ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited ?c ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?nd)
      (direct ?from ?to)
      (not (visited ?to ?nd))
      (not (at ?to))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at ?from))
      (at ?to)
      (visited ?to ?nd)
    )
  )
)