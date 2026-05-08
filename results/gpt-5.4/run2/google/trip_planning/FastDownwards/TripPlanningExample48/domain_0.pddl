(define (domain european_trip_4_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (current_day ?d - day)
    (trip_complete)
  )

  (:action assign_first_day
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
    )
    :effect (and
      (assigned day_1)
      (at day_1 ?c)
      (not (current_day day_1))
      (current_day day_2)
    )
  )

  (:action assign_day_2_stay
    :parameters (?c - city)
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (assigned day_1)
      (at day_1 ?c)
      (not (assigned day_2))
    )
    :effect (and
      (assigned day_2)
      (at day_2 ?c)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action assign_day_2_fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (current_day day_2)
      (next_day day_1 day_2)
      (assigned day_1)
      (at day_1 ?from)
      (direct ?from ?to)
      (not (at day_1 ?to))
      (not (assigned day_2))
    )
    :effect (and
      (assigned day_2)
      (at day_2 ?to)
      (not (current_day day_2))
      (current_day day_3)
    )
  )

  (:action assign_day_3_stay
    :parameters (?c - city)
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (assigned day_2)
      (at day_2 ?c)
      (not (assigned day_3))
    )
    :effect (and
      (assigned day_3)
      (at day_3 ?c)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_3_fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (current_day day_3)
      (next_day day_2 day_3)
      (assigned day_2)
      (at day_2 ?from)
      (direct ?from ?to)
      (not (at day_2 ?to))
      (not (assigned day_3))
    )
    :effect (and
      (assigned day_3)
      (at day_3 ?to)
      (not (current_day day_3))
      (current_day day_4)
    )
  )

  (:action assign_day_4_stay
    :parameters (?c - city)
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (assigned day_3)
      (at day_3 ?c)
      (not (assigned day_4))
    )
    :effect (and
      (assigned day_4)
      (at day_4 ?c)
      (not (current_day day_4))
      (trip_complete)
    )
  )

  (:action assign_day_4_fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (current_day day_4)
      (next_day day_3 day_4)
      (assigned day_3)
      (at day_3 ?from)
      (direct ?from ?to)
      (not (at day_3 ?to))
      (not (assigned day_4))
    )
    :effect (and
      (assigned day_4)
      (at day_4 ?to)
      (not (current_day day_4))
      (trip_complete)
    )
  )
)