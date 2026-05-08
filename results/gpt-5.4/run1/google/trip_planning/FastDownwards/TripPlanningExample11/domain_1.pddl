(define (domain trip_planning_example11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (visited ?c - city ?d - day)
    (must_be_in ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?dnext)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
      (visited ?c ?d)
    )
  )

  (:action fly_and_stay
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (current_day ?d)
      (next_day ?d ?dnext)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dnext)
      (visited ?to ?d)
    )
  )
)