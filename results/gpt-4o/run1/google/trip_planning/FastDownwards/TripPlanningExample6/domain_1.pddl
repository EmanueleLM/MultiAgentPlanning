(define (domain city_visit)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types city day)

  (:predicates
    (current_city ?city - city)
    (visited ?city - city)
    (next_day ?d1 - day ?d2 - day)
    (has_direct_flight ?from - city ?to - city)
    (conference_day ?day - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?from_day - day ?to_day - day)
    :precondition (and
      (current_city ?from)
      (next_day ?from_day ?to_day)
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
    :effect (and)
  )
)