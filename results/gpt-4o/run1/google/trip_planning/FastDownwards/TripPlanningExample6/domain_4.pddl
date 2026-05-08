(define (domain city_trip_planning)
  (:requirements :strips :typing)

  (:types city day)

  (:predicates
    (current_city ?c - city)
    (next_day ?d1 - day ?d2 - day)
    (has_direct_flight ?from - city ?to - city)
    (stayed ?c - city ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?day - day ?next_day - day)
    :precondition (and
      (current_city ?from)
      (next_day ?day ?next_day)
      (has_direct_flight ?from ?to)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
    )
  )

  (:action stay
    :parameters (?city - city ?day - day ?next_day - day)
    :precondition (and
      (current_city ?city)
      (next_day ?day ?next_day)
    )
    :effect (and
      (stayed ?city ?day)
      (next_day ?day ?next_day)
    )
  )
)