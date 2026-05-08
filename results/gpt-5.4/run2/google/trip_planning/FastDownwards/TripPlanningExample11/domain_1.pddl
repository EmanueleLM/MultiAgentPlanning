(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (used ?d - day)
    (start ?d - day)
    (need_city_days ?c - city ?n - day)
    (conference ?d - day ?c - city)
  )

  (:action initialize_day
    :parameters (?c - city)
    :precondition (and
      (start day_1)
      (not (used day_1))
    )
    :effect (and
      (used day_1)
      (at ?c day_1)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (used ?d1)
      (at ?c ?d1)
      (not (used ?d2))
    )
    :effect (and
      (used ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (used ?d1)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (used ?d2))
      (not (at ?to ?d1))
    )
    :effect (and
      (used ?d2)
      (at ?to ?d2)
    )
  )
)