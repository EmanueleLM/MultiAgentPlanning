(define (domain trip_planning_example11)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (stay_requirement ?c - city ?d - day)
  )

  (:action stay_day
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?dnext)
      (stay_requirement ?c ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_day
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (current_day ?d)
      (next_day ?d ?dnext)
      (flight ?from ?to)
      (stay_requirement ?to ?d)
      (not (stay_requirement ?from ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )
)