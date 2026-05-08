(define (domain tripplanningexample47)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at paris day_3))
      (not (at paris day_4))
      (not (at paris day_5))
      (not (at paris day_6))
      (not (at paris day_7))
      (not (at istanbul day_1))
      (not (at istanbul day_2))
      (not (at istanbul day_5))
      (not (at istanbul day_6))
      (not (at istanbul day_7))
      (not (at salzburg day_1))
      (not (at salzburg day_2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at paris day_3))
      (not (at paris day_4))
      (not (at paris day_5))
      (not (at paris day_6))
      (not (at paris day_7))
      (not (at istanbul day_1))
      (not (at istanbul day_2))
      (not (at istanbul day_5))
      (not (at istanbul day_6))
      (not (at istanbul day_7))
      (not (at salzburg day_1))
      (not (at salzburg day_2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
      (visited ?to)
    )
  )
)