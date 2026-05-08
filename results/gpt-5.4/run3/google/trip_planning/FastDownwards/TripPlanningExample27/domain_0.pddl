(define (domain european_trip_14_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c ?d1)
      (not (at amsterdam ?d2))
      (not (at istanbul ?d2))
      (not (at santorini ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from ?d1)
      (direct_flight ?from ?to)
      (not (at ?to ?d1))
      (not (at amsterdam ?d2))
      (not (at istanbul ?d2))
      (not (at santorini ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
    )
  )
)