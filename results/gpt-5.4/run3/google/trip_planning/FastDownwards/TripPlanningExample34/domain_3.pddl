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
    (visited_on ?d - day ?c - city)
    (final_day ?d - day)
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?c)
      (not (visited_on ?d ?c))
    )
    :effect (and
      (visited_on ?d ?c)
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
      (not (visited_on ?d ?from))
    )
    :effect (and
      (visited_on ?d ?from)
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
      (not (visited_on ?d ?c))
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))
    )
  )
)