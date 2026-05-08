(define (domain trip_planning_example27)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited ?d - day ?c - city)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at amsterdam))
      (not (at istanbul))
      (not (at santorini))
      (not (visited day_1 amsterdam))
      (not (visited day_1 istanbul))
      (not (visited day_1 santorini))
    )
    :effect (and
      (at ?c)
      (visited day_1 ?c)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (visited ?d1 ?c)
      (not (visited ?d2 amsterdam))
      (not (visited ?d2 istanbul))
      (not (visited ?d2 santorini))
    )
    :effect (and
      (visited ?d2 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (visited ?d1 ?from)
      (direct ?from ?to)
      (not (at ?to))
      (not (visited ?d2 amsterdam))
      (not (visited ?d2 istanbul))
      (not (visited ?d2 santorini))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)