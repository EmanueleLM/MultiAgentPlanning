(define (domain european_trip_10_day_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (today ?d - day)
    (visited_on ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at ?c)
      (not (visited_on ?d2 bucharest))
      (not (visited_on ?d2 zurich))
      (not (visited_on ?d2 dubrovnik))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (visited_on ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (visited_on ?d2 bucharest))
      (not (visited_on ?d2 zurich))
      (not (visited_on ?d2 dubrovnik))
    )
    :effect (and
      (not (today ?d))
      (today ?d2)
      (not (at ?from))
      (at ?to)
      (visited_on ?d2 ?to)
    )
  )
)