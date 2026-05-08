(define (domain european_trip_13days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (day_cursor ?d - day)
    (visited_on ?d - day ?c - city)
    (required ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (day_cursor ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited_on ?d2 ?c))
    )
    :effect (and
      (visited_on ?d2 ?c)
      (not (day_cursor ?d1))
      (day_cursor ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (day_cursor ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
      (not (visited_on ?d2 ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?d2 ?to)
      (not (day_cursor ?d1))
      (day_cursor ?d2)
    )
  )
)