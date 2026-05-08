(define (domain tripplanningexample27)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (travel_day ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (travel_day ?d1))
    )
    :effect (and
      (not (at ?c ?d1))
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (travel_day ?d1)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?from ?d1))
      (at ?to ?d2)
    )
  )
)