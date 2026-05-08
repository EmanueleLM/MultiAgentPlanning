(define (domain tripplanningexample46)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (in_city_on ?d - day ?c - city)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d1)
      (next ?d1 ?d2)
      (not (in_city_on ?d2 seville))
      (not (in_city_on ?d2 manchester))
      (not (in_city_on ?d2 stockholm))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (in_city_on ?d2 ?c)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (in_city_on ?d2 seville))
      (not (in_city_on ?d2 manchester))
      (not (in_city_on ?d2 stockholm))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d1))
      (current ?d2)
      (in_city_on ?d2 ?to)
      (visited ?to)
    )
  )
)