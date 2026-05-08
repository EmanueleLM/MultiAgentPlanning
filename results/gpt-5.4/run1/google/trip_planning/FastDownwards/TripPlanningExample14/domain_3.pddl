(define (domain trip_planning_example14)
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
    (occupied ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?c)
      (not (occupied ?d ?c))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly
    :parameters (?d - day ?d_next - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from ?to)
      (not (occupied ?d ?from))
    )
    :effect (and
      (occupied ?d ?from)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (not (occupied ?d ?c))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current_day ?d))
    )
  )
)