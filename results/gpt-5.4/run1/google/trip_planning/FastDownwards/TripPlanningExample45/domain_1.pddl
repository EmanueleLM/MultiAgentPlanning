(define (domain trip_planning_example45)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (today ?d - day)
    (visited_day_city ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?c)
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (visited_day_city ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (today ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (not (at ?from))
      (at ?to)
      (visited_day_city ?d2 ?to)
    )
  )
)