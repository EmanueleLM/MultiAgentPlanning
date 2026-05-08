(define (domain european_trip_16days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?d - day ?c - city)
  )

  (:action start_in
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at valencia))
      (not (at lyon))
      (not (at split))
      (not (visited day_1 valencia))
      (not (visited day_1 lyon))
      (not (visited day_1 split))
    )
    :effect (and
      (at ?c)
      (visited day_1 ?c)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (visited ?d2 valencia))
      (not (visited ?d2 lyon))
      (not (visited ?d2 split))
    )
    :effect (and
      (visited ?d2 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited ?d2 valencia))
      (not (visited ?d2 lyon))
      (not (visited ?d2 split))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)