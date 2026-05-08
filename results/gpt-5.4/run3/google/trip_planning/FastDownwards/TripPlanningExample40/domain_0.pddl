(define (domain european_trip_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?d - day ?c - city)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (assigned ?d - day)
    (current_day ?d - day)
  )

  (:action assign_first_day_oslo
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (assigned day1))
    )
    :effect (and
      (at day1 oslo)
      (assigned day1)
    )
  )

  (:action assign_first_day_reykjavik
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (assigned day1))
    )
    :effect (and
      (at day1 reykjavik)
      (assigned day1)
    )
  )

  (:action assign_first_day_manchester
    :parameters ()
    :precondition (and
      (current_day day1)
      (not (assigned day1))
    )
    :effect (and
      (at day1 manchester)
      (assigned day1)
    )
  )

  (:action assign_next_same_city
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action assign_next_by_flight
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (direct_flight ?from ?to)
      (not (assigned ?d2))
      (not (at ?d1 ?to))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)