(define (domain tripplanningexample15)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (current_day ?d - day)
    (visited_on ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?nd)
      (not (visited_on ?c ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (visited_on ?c ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?nd)
      (flight ?from ?to)
      (not (visited_on ?to ?nd))
      (not (at ?to))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?nd)
    )
  )
)