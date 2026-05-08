(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (next_day_link ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (city_count ?c - city ?n - count)
    (flight ?c1 ?c2 - city)
  )

  (:action spend_day
    :parameters (?c - city ?d - day ?n_old - count ?n_new - count)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (city_count ?c ?n_old)
      (next_count ?n_old ?n_new)
      (not (visited ?c ?d))
    )
    :effect (and
      (visited ?c ?d)
      (not (city_count ?c ?n_old))
      (city_count ?c ?n_new)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action advance_day
    :parameters (?d_old - day ?d_new - day)
    :precondition (and
      (current_day ?d_old)
      (next_day_link ?d_old ?d_new)
    )
    :effect (and
      (not (current_day ?d_old))
      (current_day ?d_new)
    )
  )
)