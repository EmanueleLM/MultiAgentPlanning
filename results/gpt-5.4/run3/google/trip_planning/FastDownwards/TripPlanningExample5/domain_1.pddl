(define (domain european_trip_16days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (assigned ?d - day)
    (started)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (not (started))
      (current_day d1)
      (not (assigned d1))
    )
    :effect (and
      (started)
      (assigned d1)
      (at ?c d1)
    )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?c ?d1)
      (not (assigned ?d2))
    )
    :effect (and
      (assigned ?d2)
      (at ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?from ?d1)
      (direct_flight ?from ?to)
      (not (assigned ?d2))
      (not (at ?to ?d1))
    )
    :effect (and
      (assigned ?d2)
      (at ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)