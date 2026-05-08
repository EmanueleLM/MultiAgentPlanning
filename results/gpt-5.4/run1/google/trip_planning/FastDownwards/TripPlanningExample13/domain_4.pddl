(define (domain tripplanningexample13_domain)
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

    (require_lyon_day ?d - day)
    (trip_finished)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?d2)
      (not (trip_finished))
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
      (at ?from)
      (current_day ?d)
      (next ?d ?d2)
      (direct ?from ?to)
      (not (trip_finished))
    )
    :effect (and
      (visited_on ?from ?d)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action finish_in_city
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (not (trip_finished))
    )
    :effect (and
      (visited_on ?c ?d)
      (trip_finished)
      (not (current_day ?d))
    )
  )
)