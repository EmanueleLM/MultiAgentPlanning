(define (domain european_trip_10_days_instance)
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
    (visited ?c - city ?d - day)
    (required ?c - city ?d - day)
    (started)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (started))
    )
    :effect (and
      (started)
      (at ?c)
      (visited ?c day1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited ?c ?d2))
    )
    :effect (and
      (visited ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited ?to ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)