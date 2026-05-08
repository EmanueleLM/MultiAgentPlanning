(define (domain trip_planning)

  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at_city ?c - city ?d - day)
    (has_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (city_visited ?c - city)
  )

  (:action travel
    :parameters (?from - city ?to - city ?d - day ?next_d - day)
    :precondition (and
      (at_city ?from ?d)
      (has_flight ?from ?to)
      (next ?d ?next_d)
    )
    :effect (and
      (not (at_city ?from ?d))
      (at_city ?to ?next_d)
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?next_d - day)
    :precondition (and
      (at_city ?c ?d)
      (next ?d ?next_d)
      (not (city_visited ?c))
    )
    :effect (and
      (not (at_city ?c ?d))
      (at_city ?c ?next_d)
      (when (at_city ?c day10) ; Ensure 'day10' is used consistently
        (city_visited ?c)
      )
    )
  )
)