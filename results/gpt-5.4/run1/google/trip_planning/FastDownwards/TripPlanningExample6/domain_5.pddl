(define (domain trip_planning_example6)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (last_day ?d - day)
    (required_city ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (at ?c)
      (required_city ?d ?c)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?nd)
      (at ?from)
      (direct ?from ?to)
      (required_city ?d ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (required_city ?d ?c)
    )
    :effect (and
      (not (current_day ?d))
    )
  )

  (:action fly_last_day
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct ?from ?to)
      (required_city ?d ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
    )
  )
)