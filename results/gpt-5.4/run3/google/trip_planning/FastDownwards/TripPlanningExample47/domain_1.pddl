(define (domain trip_planning_example47)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (in_city ?c - city ?d - day)
    (day_used ?d - day)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (in_city ?c ?d1)
      (next_day ?d1 ?d2)
      (not (day_used ?d2))
    )
    :effect (and
      (in_city ?c ?d2)
      (day_used ?d2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (in_city ?from ?d1)
      (next_day ?d1 ?d2)
      (direct ?from ?to)
      (not (day_used ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (in_city ?to ?d2)
      (day_used ?d2)
      (visited ?to)
    )
  )
)