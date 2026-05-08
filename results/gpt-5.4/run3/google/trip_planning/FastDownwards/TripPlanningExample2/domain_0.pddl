(define (domain european_trip_11_days_unsat)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (current_day ?d - day)
    (started)
    (final_day ?d - day)
  )

  (:action choose_start_city
    :parameters (?c - city)
    :precondition (not (started))
    :effect (and
      (started)
      (assigned day_1)
      (current_day day_1)
      (at ?c day_1)
    )
  )

  (:action assign_next_day_stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c ?d1)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action assign_next_day_flight
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (assigned ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (at ?to ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)