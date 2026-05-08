(define (domain trip_planning_example7)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (day_cursor ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (day_cursor ?d)
      (next_day ?d ?d2)
    )
    :effect (and
      (visited ?d ?c)
      (not (day_cursor ?d))
      (day_cursor ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (day_cursor ?d)
      (next_day ?d ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?d ?to)
      (not (day_cursor ?d))
      (day_cursor ?d2)
    )
  )
)