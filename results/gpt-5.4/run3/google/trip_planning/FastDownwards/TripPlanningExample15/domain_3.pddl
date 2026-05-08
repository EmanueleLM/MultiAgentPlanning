(define (domain trip_planning_example15)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited_on ?c - city ?d - day)
  )

  (:action start_day_1
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (at berlin))
      (not (at porto))
      (not (at krakow))
      (not (visited_on berlin d1))
      (not (visited_on porto d1))
      (not (visited_on krakow d1))
    )
    :effect (and
      (at ?c)
      (visited_on ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited_on berlin ?d2))
      (not (visited_on porto ?d2))
      (not (visited_on krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (not (visited_on berlin ?d2))
      (not (visited_on porto ?d2))
      (not (visited_on krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d2)
    )
  )
)