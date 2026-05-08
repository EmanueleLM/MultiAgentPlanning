(define (domain tripplanningexample34)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?d2 - day)
    (current_day ?d - day)
    (spent ?d - day ?c - city)
    (required ?d - day ?c - city)
    (final_day ?d - day)
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?c)
      (required ?d ?c)
      (not (spent ?d ?c))
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?from)
      (direct ?from ?to)
      (required ?d ?to)
      (not (spent ?d ?to))
    )
    :effect (and
      (spent ?d ?to)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (final_day ?d)
      (at ?c)
      (required ?d ?c)
      (not (spent ?d ?c))
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
    )
  )
)