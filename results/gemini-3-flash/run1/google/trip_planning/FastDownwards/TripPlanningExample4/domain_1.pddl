(define (domain trip_planning_example_4)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city - object
    day - object
    count - object
  )
  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (can_fly ?c1 - city ?c2 - city)
    (stay_count ?c - city ?n - count)
  )

  ;; The 'stay' action: spend the next day in the same city.
  (:action stay
    :parameters (?c - city ?d_current - day ?d_next - day ?n_current - count ?n_next - count)
    :precondition (and
      (at ?c ?d_current)
      (next_day ?d_current ?d_next)
      (stay_count ?c ?n_current)
      (next_count ?n_current ?n_next)
    )
    :effect (and
      (not (at ?c ?d_current))
      (at ?c ?d_next)
      (not (stay_count ?c ?n_current))
      (stay_count ?c ?n_next)
    )
  )

  ;; The 'fly' action: spend the next day in a different city.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_current - day ?d_next - day ?n_current - count ?n_next - count)
    :precondition (and
      (at ?c_from ?d_current)
      (next_day ?d_current ?d_next)
      (can_fly ?c_from ?c_to)
      (stay_count ?c_to ?n_current)
      (next_count ?n_current ?n_next)
    )
    :effect (and
      (not (at ?c_from ?d_current))
      (at ?c_to ?d_next)
      (not (stay_count ?c_to ?n_current))
      (stay_count ?c_to ?n_next)
    )
  )
)