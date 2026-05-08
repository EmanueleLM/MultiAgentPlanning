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
    (visited ?c - city ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (at berlin))
      (not (at porto))
      (not (at krakow))
      (not (visited berlin day1))
      (not (visited porto day1))
      (not (visited krakow day1))
    )
    :effect (and
      (at ?c)
      (visited ?c day1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited berlin ?d2))
      (not (visited porto ?d2))
      (not (visited krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited berlin ?d2))
      (not (visited porto ?d2))
      (not (visited krakow ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?to ?d2)
    )
  )
)