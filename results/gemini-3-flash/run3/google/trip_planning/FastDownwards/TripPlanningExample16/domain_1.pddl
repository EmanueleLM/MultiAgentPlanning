(define (domain trip_planning_example_16)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; Stay in the same city for another day
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?n_curr - count ?n_next - count)
    :precondition (and
      (at ?c ?d_curr)
      (next_day ?d_curr ?d_next)
      (stay_count ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (at ?c ?d_next)
      (visited ?c ?d_next)
      (stay_count ?c ?n_next)
      (not (at ?c ?d_curr))
      (not (stay_count ?c ?n_curr))
    )
  )

  ;; Fly to a new city and spend the day there
  (:action fly
    :parameters (?from - city ?to - city ?d_curr - day ?d_next - day ?n_curr - count ?n_next - count)
    :precondition (and
      (at ?from ?d_curr)
      (next_day ?d_curr ?d_next)
      (flight ?from ?to)
      (stay_count ?to ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and
      (at ?to ?d_next)
      (visited ?to ?d_next)
      (stay_count ?to ?n_next)
      (not (at ?from ?d_curr))
      (not (stay_count ?to ?n_curr))
    )
  )
)