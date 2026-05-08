(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (occupied ?d - day ?c - city)
  )

  (:action stay_to_next_day
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?c)
      (not (occupied ?d2 istanbul))
      (not (occupied ?d2 budapest))
      (not (occupied ?d2 dubrovnik))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (occupied ?d2 ?c)
    )
  )

  (:action fly_to_next_day
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (occupied ?d2 istanbul))
      (not (occupied ?d2 budapest))
      (not (occupied ?d2 dubrovnik))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (occupied ?d2 ?to)
    )
  )
)