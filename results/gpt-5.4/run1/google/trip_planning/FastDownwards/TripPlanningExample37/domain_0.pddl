(define (domain europe_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (spent_day_in ?d - day ?c - city)
  )

  (:action stay_in_city
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?c)
      (not (spent_day_in ?d reykjavik))
      (not (spent_day_in ?d milan))
      (not (spent_day_in ?d porto))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (spent_day_in ?d ?c)
    )
  )

  (:action fly_and_stay
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (spent_day_in ?d reykjavik))
      (not (spent_day_in ?d milan))
      (not (spent_day_in ?d porto))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (spent_day_in ?d ?to)
    )
  )
)