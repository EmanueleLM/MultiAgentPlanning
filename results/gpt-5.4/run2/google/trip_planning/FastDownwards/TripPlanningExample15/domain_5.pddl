(define (domain trip_planning_example15)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)
    (in_city_on ?c - city ?d - day)
    (used_day ?d - day)
    (wedding_day ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (used_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (used_day ?d2)
      (in_city_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (used_day ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (used_day ?d2)
      (in_city_on ?to ?d2)
    )
  )
)