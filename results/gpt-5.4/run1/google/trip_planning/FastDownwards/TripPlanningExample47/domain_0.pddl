(define (domain european_trip_7_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
  )

  (:action progress_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c ?d1)
      (not (at paris ?d2))
      (not (at istanbul ?d2))
      (not (at salzburg ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
    )
  )

  (:action progress_fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at paris ?d2))
      (not (at istanbul ?d2))
      (not (at salzburg ?d2))
      (not (at ?from ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
    )
  )
)