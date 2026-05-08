(define (domain tripplanningexample10)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next ?d - day ?nd - day)
    (visited_on ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?nd)
      (not (visited_on oslo ?nd))
      (not (visited_on dublin ?nd))
      (not (visited_on valencia ?nd))
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
      (direct ?from ?to)
      (not (visited_on oslo ?nd))
      (not (visited_on dublin ?nd))
      (not (visited_on valencia ?nd))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?nd)
      (visited_on ?to ?nd)
    )
  )
)