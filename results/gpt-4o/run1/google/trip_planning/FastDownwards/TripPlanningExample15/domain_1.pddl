(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (current_city ?c - city)
    (on_day ?d - day)
    (visited ?c - city)
    (wedding_attended)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?day_from - day ?day_to - day)
    :precondition (and
      (current_city ?from)
      (on_day ?day_from)
      (direct_flight ?from ?to)
      (next ?day_from ?day_to)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (not (on_day ?day_from))
      (on_day ?day_to)
    )
  )

  (:action stay
    :parameters (?where - city ?start_day - day ?end_day - day)
    :precondition (and
      (current_city ?where)
      (on_day ?start_day)
      (next ?start_day ?end_day)
    )
    :effect (and
      (not (on_day ?start_day))
      (on_day ?end_day)
      (visited ?where)
    )
  )

  (:action attend_wedding
    :parameters (?day_from - day ?day_wedding - day)
    :precondition (and
      (current_city porto)
      (on_day ?day_from)
      (next ?day_from ?day_wedding)
      (next day_10 day_11)
    )
    :effect (wedding_attended)
  )