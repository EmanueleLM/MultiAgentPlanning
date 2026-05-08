(define (domain tripplanningexample17)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d ?nd - day)
    (current_day ?d - day)
    (visited ?d - day ?c - city)
    (conference ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?nd)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited ?nd ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?nd)
      (direct ?from ?to)
      (not (conference ?nd ?from))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?nd)
      (visited ?nd ?to)
    )
  )
)