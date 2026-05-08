(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)

    (visited_venice ?d - day)
    (visited_dubrovnik ?d - day)
    (visited_istanbul ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct_flight ?from ?to)
      (current_day ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action mark_visited_venice
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at venice)
      (not (visited_venice ?d))
    )
    :effect (visited_venice ?d)
  )

  (:action mark_visited_dubrovnik
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at dubrovnik)
      (not (visited_dubrovnik ?d))
    )
    :effect (visited_dubrovnik ?d)
  )

  (:action mark_visited_istanbul
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at istanbul)
      (not (visited_istanbul ?d))
    )
    :effect (visited_istanbul ?d)
  )
)