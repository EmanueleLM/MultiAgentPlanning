(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited ?d - day ?c - city)
    (workshop_day ?d - day)
  )

  (:action choose_start
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (visited day_1 frankfurt))
      (not (visited day_1 bucharest))
      (not (visited day_1 stuttgart))
    )
    :effect (and
      (at ?c)
      (visited day_1 ?c)
    )
  )

  (:action stay
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c)
      (visited ?d ?c)
      (not (visited ?d_next frankfurt))
      (not (visited ?d_next bucharest))
      (not (visited ?d_next stuttgart))
    )
    :effect (and
      (visited ?d_next ?c)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly
    :parameters (?d - day ?d_next - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (visited ?d ?from)
      (direct_flight ?from ?to)
      (not (visited ?d_next frankfurt))
      (not (visited ?d_next bucharest))
      (not (visited ?d_next stuttgart))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?d_next ?to)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )
)