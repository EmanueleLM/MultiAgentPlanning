(define (domain european_trip_17_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d - day ?dn - day)
    (direct_flight ?from - city ?to - city)
    (in_lyon_window ?d - day)
    (spent ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?dn)
      (not (spent ?c ?d))
    )
    :effect (and
      (spent ?c ?d)
      (not (current_day ?d))
      (current_day ?dn)
    )
  )

  (:action stay_last_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (not (spent ?c ?d))
      (not (next_day ?d day_1))
    )
    :effect (and
      (spent ?c ?d)
      (not (current_day ?d))
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)