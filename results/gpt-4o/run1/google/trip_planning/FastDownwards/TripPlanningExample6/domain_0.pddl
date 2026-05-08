(define (domain city_visit)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types city day)

  (:predicates
    (at ?city - city ?day - day)
    (visited ?city - city)
    (next_day ?d1 - day ?d2 - day)
    (has_direct_flight ?from - city ?to - city)
    (conference_day ?day - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?from_day - day ?to_day - day)
    :precondition (and
      (at ?from ?from_day)
      (next_day ?from_day ?to_day)
      (has_direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from ?from_day))
      (at ?to ?to_day)
    )
  )

  (:action stay
    :parameters (?city - city ?day - day ?next_day - day)
    :precondition (and
      (at ?city ?day)
      (next_day ?day ?next_day)
    )
    :effect (and
      (not (at ?city ?day))
      (at ?city ?next_day)
    )
  )
)