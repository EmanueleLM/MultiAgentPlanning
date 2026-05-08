(define (domain trip_planning_example38)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (spent ?d - day ?c - city)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?d - day ?dnext - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
      (not (spent ?d ?c))
    )
    :effect (and
      (spent ?d ?c)
      (visited ?c)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (not (spent ?d ?c))
    )
    :effect (and
      (spent ?d ?c)
      (visited ?c)
      (not (current_day ?d))
    )
  )

  (:action fly
    :parameters (?d - day ?dnext - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from ?to)
      (not (?from ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?d ?to)
      (visited ?to)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_last_day
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct ?from ?to)
      (not (?from ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?d ?to)
      (visited ?to)
      (not (current_day ?d))
    )
  )
)