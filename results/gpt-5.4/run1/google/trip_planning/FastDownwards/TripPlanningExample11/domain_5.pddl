(define (domain trip_planning_example11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (in_city_on ?d - day ?c - city)
    (conference_on ?d - day)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at ?c)
        (in_city_on ?d ?c)
      )
    :effect
      (and
        (not (current_day ?d))
        (current_day ?dn)
        (visited ?c)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition
      (and
        (current_day ?d)
        (next_day ?d ?dn)
        (at ?from)
        (direct ?from ?to)
        (in_city_on ?d ?to)
        (not (at ?to))
      )
    :effect
      (and
        (not (at ?from))
        (at ?to)
        (visited ?to)
        (not (current_day ?d))
        (current_day ?dn)
      )
  )
)