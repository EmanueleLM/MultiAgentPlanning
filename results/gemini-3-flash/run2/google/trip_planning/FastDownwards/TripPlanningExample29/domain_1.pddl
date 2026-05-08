(define (domain trip_planning_example_29)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (was_at ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (can_fly ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not (started))
    :effect (and
      (started)
      (at ?c d1)
      (was_at ?c d1)
      (not (stay_count ?c n0))
      (stay_count ?c n1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?n_curr - count ?n_next - count)
    :precondition (and
      (at ?c ?d_curr)
      (next_day ?d_curr ?d_next)
      (stay_count ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (not (at ?c ?d_curr))
      (at ?c ?d_next)
      (was_at ?c ?d_next)
      (not (stay_count ?c ?n_curr))
      (stay_count ?c ?n_next)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d_curr - day ?d_next - day ?n_to_curr - count ?n_to_next - count)
    :precondition (and
      (at ?from ?d_curr)
      (can_fly ?from ?to)
      (next_day ?d_curr ?d_next)
      (stay_count ?to ?n_to_curr)
      (next_count ?n_to_curr ?n_to_next)
    )
    :effect (and
      (not (at ?from ?d_curr))
      (at ?to ?d_next)
      (was_at ?to ?d_next)
      (not (stay_count ?to ?n_to_curr))
      (stay_count ?to ?n_to_next)
    )
  )
)