(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited_on ?c - city ?d - day)
    (started)
    (finished)
  )

  (:action start
    :parameters (?c - city)
    :precondition (not (started))
    :effect (and
      (started)
      (at ?c)
      (current_day day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (started)
      (at ?c)
      (current_day ?d)
      (next ?d ?d2)
      (not (visited_on ?c ?d))
    )
    :effect (and
      (visited_on ?c ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (started)
      (at ?from)
      (current_day ?d)
      (next ?d ?d2)
      (direct_flight ?from ?to)
      (not (visited_on ?from ?d))
      (not (at ?to))
    )
    :effect (and
      (visited_on ?from ?d)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action finish
    :parameters (?c - city ?d - day)
    :precondition (and
      (started)
      (at ?c)
      (current_day ?d)
      (not (visited_on ?c ?d))
    )
    :effect (and
      (visited_on ?c ?d)
      (finished)
      (not (current_day ?d))
    )
  )
)