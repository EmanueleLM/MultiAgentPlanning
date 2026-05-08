(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day num)
  (:predicates
    (at_city ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (visit_count ?c - city ?n - num)
    (next_day ?d1 ?d2 - day)
    (next_num ?n1 ?n2 - num)
    (has_flight ?c1 ?c2 - city)
    (not_started)
    (is_day1 ?d - day)
    (is_num0 ?n - num)
    (is_num1 ?n - num)
  )

  ;; Start the trip at any city on Day 1
  (:action start_trip
    :parameters (?c - city ?d1 - day ?n0 - num ?n1 - num)
    :precondition (and (not_started) (is_day1 ?d1) (is_num0 ?n0) (is_num1 ?n1) (visit_count ?c ?n0))
    :effect (and
      (not (not_started))
      (at_city ?c ?d1)
      (visited ?c ?d1)
      (not (visit_count ?c ?n0))
      (visit_count ?c ?n1)
    )
  )

  ;; Stay in the current city for one more day
  (:action stay
    :parameters (?c - city ?d_prev - day ?d_curr - day ?n_old - num ?n_new - num)
    :precondition (and
      (at_city ?c ?d_prev)
      (next_day ?d_prev ?d_curr)
      (visit_count ?c ?n_old)
      (next_num ?n_old ?n_new)
    )
    :effect (and
      (not (at_city ?c ?d_prev))
      (at_city ?c ?d_curr)
      (visited ?c ?d_curr)
      (not (visit_count ?c ?n_old))
      (visit_count ?c ?n_new)
    )
  )

  ;; Fly from one city to another on a specific day.
  ;; The travel day counts as a visit day for both the departure and arrival city.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_prev - day ?d_curr - day ?n_from_old - num ?n_from_new - num ?n_to_old - num ?n_to_new - num)
    :precondition (and
      (at_city ?c_from ?d_prev)
      (next_day ?d_prev ?d_curr)
      (has_flight ?c_from ?c_to)
      (visit_count ?c_from ?n_from_old)
      (next_num ?n_from_old ?n_from_new)
      (visit_count ?c_to ?n_to_old)
      (next_num ?n_to_old ?n_to_new)
    )
    :effect (and
      (not (at_city ?c_from ?d_prev))
      (at_city ?c_to ?d_curr)
      (visited ?c_from ?d_curr)
      (visited ?c_to ?d_curr)
      (not (visit_count ?c_from ?n_from_old))
      (visit_count ?c_from ?n_from_new)
      (not (visit_count ?c_to ?n_to_old))
      (visit_count ?c_to ?n_to_new)
    )
  )
)