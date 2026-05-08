(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)
    (visited_on ?d - day ?c - city)
  )

  (:action start_trip
    :parameters (?start_day - day ?c - city)
    :precondition (and
      (current_day ?start_day)
      (not (at reykjavik))
      (not (at riga))
      (not (at paris))
      (not (visited_on ?start_day reykjavik))
      (not (visited_on ?start_day riga))
      (not (visited_on ?start_day paris))
    )
    :effect (and
      (at ?c)
      (visited_on ?start_day ?c)
    )
  )

  (:action stay_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (visited_on ?d1 ?c)
      (not (visited_on ?d2 reykjavik))
      (not (visited_on ?d2 riga))
      (not (visited_on ?d2 paris))
    )
    :effect (and
      (visited_on ?d2 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (visited_on ?d1 ?from)
      (direct_flight ?from ?to)
      (not (visited_on ?d2 reykjavik))
      (not (visited_on ?d2 riga))
      (not (visited_on ?d2 paris))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?d2 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)