(define (domain european_trip_7_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (spent ?d - day)
    (spent_in ?d - day ?c - city)
    (visited ?c - city)
    (trip_complete)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (not (trip_complete))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to)
    )
  )

  (:action spend_day_nonlast
    :parameters (?d - day ?dnext - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
      (not (spent ?d))
      (not (trip_complete))
    )
    :effect (and
      (spent ?d)
      (spent_in ?d ?c)
      (not (current_day ?d))
      (current_day ?dnext)
      (visited ?c)
    )
  )

  (:action spend_day_last
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (not (spent ?d))
      (not (trip_complete))
    )
    :effect (and
      (spent ?d)
      (spent_in ?d ?c)
      (not (current_day ?d))
      (trip_complete)
      (visited ?c)
    )
  )
)