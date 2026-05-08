(define (domain trip_planning_example5)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (started)
    (finished)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (not (started))
    )
    :effect (and
      (started)
      (current_day day_1)
      (at ?c day_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?c ?d)
      (not (at oslo ?nd))
      (not (at porto ?nd))
      (not (at dubrovnik ?nd))
    )
    :effect (and
      (at ?c ?nd)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?nd)
      (at ?from ?d)
      (direct ?from ?to)
      (not (at oslo ?nd))
      (not (at porto ?nd))
      (not (at dubrovnik ?nd))
    )
    :effect (and
      (at ?to ?nd)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action finish
    :parameters ()
    :precondition (and
      (current_day day_16)
    )
    :effect (and
      (finished)
    )
  )
)