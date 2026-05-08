(define (domain tripplanningexample29)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city)
    (allocated ?c - city ?d - day)
    (wedding_day ?d - day)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (at frankfurt))
      (not (at krakow))
      (not (at dubrovnik))
      (not (allocated frankfurt day1))
      (not (allocated krakow day1))
      (not (allocated dubrovnik day1))
    )
    :effect (and
      (at ?c)
      (visited ?c)
      (allocated ?c day1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (allocated frankfurt ?d2))
      (not (allocated krakow ?d2))
      (not (allocated dubrovnik ?d2))
    )
    :effect (and
      (allocated ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (allocated frankfurt ?d2))
      (not (allocated krakow ?d2))
      (not (allocated dubrovnik ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
      (allocated ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)