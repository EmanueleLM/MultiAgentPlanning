(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (venice_count_at ?n - count)
    (venice_next_count ?n1 - count ?n2 - count)

    (dubrovnik_count_at ?n - count)
    (dubrovnik_next_count ?n1 - count ?n2 - count)

    (istanbul_count_at ?n - count)
    (istanbul_next_count ?n1 - count ?n2 - count)
  )

  (:action stay_in_venice
    :parameters (?d1 - day ?d2 - day ?v1 - count ?v2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at venice)
      (venice_count_at ?v1)
      (venice_next_count ?v1 ?v2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (venice_count_at ?v1))
      (venice_count_at ?v2)
    )
  )

  (:action stay_in_dubrovnik
    :parameters (?d1 - day ?d2 - day ?c1 - count ?c2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at dubrovnik)
      (dubrovnik_count_at ?c1)
      (dubrovnik_next_count ?c1 ?c2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (dubrovnik_count_at ?c1))
      (dubrovnik_count_at ?c2)
    )
  )

  (:action stay_in_istanbul
    :parameters (?d1 - day ?d2 - day ?c1 - count ?c2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at istanbul)
      (istanbul_count_at ?c1)
      (istanbul_next_count ?c1 ?c2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (istanbul_count_at ?c1))
      (istanbul_count_at ?c2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
    )
  )
)