(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (occupied ?d - day ?c - city)
    (assigned ?d - day)
  )

  (:action stay_to_next_day
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?c)
      (not (assigned ?d))
    )
    :effect (and
      (occupied ?d ?c)
      (assigned ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (assigned ?d))
      (not (at ?to))
    )
    :effect (and
      (occupied ?d ?from)
      (assigned ?d)
      (not (current_day ?d))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action finish_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (not (assigned ?d))
    )
    :effect (and
      (occupied ?d ?c)
      (assigned ?d)
    )
  )
)