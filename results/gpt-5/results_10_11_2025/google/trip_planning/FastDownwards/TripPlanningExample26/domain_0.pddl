(define (domain audited-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (assigned ?d - day)
    (city-on-day ?c - city ?d - day)
    (direct-flight ?from - city ?to - city)
  )

  ; Assign exactly one city to a given day (cannot reassign once set)
  (:action assign-day-city
    :parameters (?c - city ?d - day)
    :precondition (and (not (assigned ?d)))
    :effect (and
      (city-on-day ?c ?d)
      (assigned ?d)
    )
  )

  ; Advance to the next day when the city remains the same across the boundary
  (:action advance-same-city
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (city-on-day ?c ?d1)
      (city-on-day ?c ?d2)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
    )
  )

  ; Advance to the next day when the city changes across the boundary; requires a direct flight
  (:action advance-with-flight
    :parameters (?c1 - city ?c2 - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (city-on-day ?c1 ?d1)
      (city-on-day ?c2 ?d2)
      (direct-flight ?c1 ?c2)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
    )
  )
)