(define (domain european_trip_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (visited ?c - city ?d - day)
    (conference_day ?d - day)
  )

  (:action stay_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (visited ?c ?d1))
    )
    :effect (and
      (visited ?c ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited ?to ?d1))
    )
    :effect (and
      (visited ?to ?d1)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (not (visited ?c ?d))
    )
    :effect (and
      (visited ?c ?d)
    )
  )

  (:action fly_last_day
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct ?from ?to)
      (not (visited ?to ?d))
    )
    :effect (and
      (visited ?to ?d)
      (not (at ?from))
      (at ?to)
    )
  )
)