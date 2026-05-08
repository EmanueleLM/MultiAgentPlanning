(define (domain tripplanningexample47)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_city ?c - city)
    (current_day ?d - day)
    (in ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (in ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (in ?to ?d2)
    )
  )
)