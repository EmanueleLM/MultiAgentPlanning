(define (domain tripplanningexample11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (in ?c - city ?d - day)
    (conference_day ?d - day)
    (last_day ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?dnext)
      (not (in ?c ?d))
    )
    :effect (and
      (in ?c ?d)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_and_stay
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?dnext)
      (direct ?from ?to)
      (not (in ?to ?d))
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (in ?to ?d)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_last_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (last_day ?d)
      (not (in ?c ?d))
    )
    :effect (and
      (in ?c ?d)
    )
  )
)