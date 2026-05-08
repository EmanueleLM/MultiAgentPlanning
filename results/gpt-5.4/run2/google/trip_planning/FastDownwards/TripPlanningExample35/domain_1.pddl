(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited_on ?d - day ?c - city)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action spend_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited_on ?d1 bucharest))
      (not (visited_on ?d1 zurich))
      (not (visited_on ?d1 dubrovnik))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?d1 ?c)
    )
  )
)