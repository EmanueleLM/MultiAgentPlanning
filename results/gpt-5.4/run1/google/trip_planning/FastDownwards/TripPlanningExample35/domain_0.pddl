(define (domain european_trip_10_day_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (day_in_city ?d - day ?c - city)
  )

  (:action stay_to_next_day
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?c)
      (not (day_in_city ?d2 bucharest))
      (not (day_in_city ?d2 zurich))
      (not (day_in_city ?d2 dubrovnik))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (day_in_city ?d2 ?c)
    )
  )

  (:action fly_to_next_day
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (day_in_city ?d2 bucharest))
      (not (day_in_city ?d2 zurich))
      (not (day_in_city ?d2 dubrovnik))
      (not (at ?to))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (day_in_city ?d2 ?to)
    )
  )
)