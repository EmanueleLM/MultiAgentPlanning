(define (domain european_trip_17days)
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

    (visited_on ?c - city ?d - day)
    (lyon_window_day ?d - day)

    (finished)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?c)
      (not (finished))
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
      (current_day ?d)
      (next ?d ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (finished))
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
    :parameters (?c - city)
    :precondition (and
      (current_day d17)
      (at ?c)
      (not (finished))
    )
    :effect (and
      (visited_on ?c d17)
      (finished)
      (not (current_day d17))
    )
  )
)