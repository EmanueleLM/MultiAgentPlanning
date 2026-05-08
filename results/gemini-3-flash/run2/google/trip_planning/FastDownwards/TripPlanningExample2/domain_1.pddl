(define (domain trip_planning_example_2)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at_city ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (has_flight ?c1 ?c2 - city)
    (not_started)
  )

  ;; Initialize the trip at any city on Day 1
  (:action start
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and
      (not (not_started))
      (at_city ?c d1)
      (visited ?c d1)
      (count ?c n1)
    )
  )

  ;; Stay in the current city for another day
  (:action stay
    :parameters (?c - city ?d_prev - day ?d_curr - day ?n_old - count ?n_new - count)
    :precondition (and
      (at_city ?c ?d_prev)
      (next_day ?d_prev ?d_curr)
      (count ?c ?n_old)
      (next_count ?n_old ?n_new)
    )
    :effect (and
      (not (at_city ?c ?d_prev))
      (at_city ?c ?d_curr)
      (not (count ?c ?n_old))
      (count ?c ?n_new)
      (visited ?c ?d_curr)
    )
  )

  ;; Fly from one city to another. The day of the flight counts for both cities.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_prev - day ?d_curr - day ?n_from_old - count ?n_from_new - count ?n_to_old - count ?n_to_new - count)
    :precondition (and
      (at_city ?c_from ?d_prev)
      (next_day ?d_prev ?d_curr)
      (has_flight ?c_from ?c_to)
      (count ?c_from ?n_from_old)
      (next_count ?n_from_old ?n_from_new)
      (count ?c_to ?n_to_old)
      (next_count ?n_to_old ?n_to_new)
    )
    :effect (and
      (not (at_city ?c_from ?d_prev))
      (at_city ?c_to ?d_curr)
      (not (count ?c_from ?n_from_old))
      (count ?c_from ?n_from_new)
      (not (count ?c_to ?n_to_old))
      (count ?c_to ?n_to_new)
      (visited ?c_from ?d_curr)
      (visited ?c_to ?d_curr)
    )
  )
)