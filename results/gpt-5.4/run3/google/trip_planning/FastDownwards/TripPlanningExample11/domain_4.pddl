(define (domain tripplanningexample11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d - day ?dnext - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?c - city ?d - day)
    (required ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?dnext)
      (not (visited ?c ?d))
    )
    :effect (and
      (visited ?c ?d)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (current_day ?d)
      (next ?d ?dnext)
      (direct ?from ?to)
      (not (visited ?to ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to ?d)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_last_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (not (visited ?c ?d))
    )
    :effect (and
      (visited ?c ?d))
  )
)