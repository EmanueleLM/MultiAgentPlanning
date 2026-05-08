(define (domain travel)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (current_city ?c - city)
    (next_day ?d1 - day ?d2 - day)
    (visited_city ?c - city)
    (at_day ?d - day)
    (flight_available ?from - city ?to - city)
    (wedding_in_zurich_between_day1_and_day7)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?from)
      (flight_available ?from ?to)
      (at_day ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
      (at_day ?d2)
      (not (at_day ?d1))
    )
  )

  (:action stay_in_city
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_city ?c)
      (at_day ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (at_day ?d2)
      (not (at_day ?d1))
    )
  )
)