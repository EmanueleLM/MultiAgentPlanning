(define (domain europe_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates 
    (at ?city - city ?day - day)
    (connected ?from - city ?to - city)
    (visited ?city - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action move
    :parameters (?from - city ?to - city ?day_from - day ?day_to - day)
    :precondition (and 
      (at ?from ?day_from)
      (connected ?from ?to)
      (next ?day_from ?day_to)
    )
    :effect (and 
      (not (at ?from ?day_to))
      (at ?to ?day_to)
      (visited ?to)
    )
  )

  (:action stay
    :parameters (?city - city ?day_from - day ?day_to - day)
    :precondition (and 
      (at ?city ?day_from)
      (next ?day_from ?day_to)
    )
    :effect (at ?city ?day_to)
  )
)