(define (domain trip_planning_example_4)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count - object
  )
  (:predicates
    (at ?c - city ?d - day)
    (day_visited ?c - city ?d - day)
    (count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  ;; The 'stay' action: spend the next day in the same city.
  ;; This increments the city's visit count by one for the new day.
  (:action stay
    :parameters (?c - city ?d_current - day ?d_next - day ?n_current - count ?n_next - count)
    :precondition (and
      (at ?c ?d_current)
      (next_day ?d_current ?d_next)
      (count ?c ?n_current)
      (next_count ?n_current ?n_next)
    )
    :effect (and
      (not (at ?c ?d_current))
      (at ?c ?d_next)
      (day_visited ?c ?d_next)
      (not (count ?c ?n_current))
      (count ?c ?n_next)
    )
  )

  ;; The 'fly' action: travel to a new city on the same calendar day.
  ;; This increments the destination city's visit count for that day.
  ;; A city can only be counted once per calendar day.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day ?n_current - count ?n_next - count)
    :precondition (and
      (at ?c_from ?d)
      (can_fly ?c_from ?c_to)
      (not (day_visited ?c_to ?d))
      (count ?c_to ?n_current)
      (next_count ?n_current ?n_next)
    )
    :effect (and
      (not (at ?c_from ?d))
      (at ?c_to ?d)
      (day_visited ?c_to ?d)
      (not (count ?c_to ?n_current))
      (count ?c_to ?n_next)
    )
  )
)