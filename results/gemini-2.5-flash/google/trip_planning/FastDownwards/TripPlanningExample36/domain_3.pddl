(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    day_count_level
  )
  (:predicates
    (at ?c - city)
    (connected ?from ?to - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (days_in_city ?c - city ?dc - day_count_level)
    (next_day_count ?dc1 ?dc2 - day_count_level)
  )

  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
    )
  )

  (:action stay_in_city
    :parameters (?c - city ?d_curr ?d_next - day ?dc_curr ?dc_next - day_count_level)
    :precondition (and
      (at ?c)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (days_in_city ?c ?dc_curr)
      (next_day_count ?dc_curr ?dc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (days_in_city ?c ?dc_curr))
      (days_in_city ?c ?dc_next)
    )
  )
)