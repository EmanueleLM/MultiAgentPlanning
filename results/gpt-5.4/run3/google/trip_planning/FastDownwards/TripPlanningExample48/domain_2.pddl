(define (domain european_trip_4_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (friend_window_day ?d - day)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at manchester))
      (not (at split))
      (not (at geneva))
      (not (visited manchester day_1))
      (not (visited split day_1))
      (not (visited geneva day_1))
    )
    :effect (and
      (at ?c)
      (visited ?c day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited manchester ?d2))
      (not (visited split ?d2))
      (not (visited geneva ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
      (not (visited manchester ?d2))
      (not (visited split ?d2))
      (not (visited geneva ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?to ?d2)
    )
  )
)