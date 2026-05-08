(define (domain trip_planning_example_32)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )
  (:predicates
    (at_city_day ?c - city ?d - day)
    (current_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited_count ?c - city ?n - count)
    (succ ?n1 - count ?n2 - count)
    (flight ?c1 - city ?c2 - city)
    (is_day_1 ?d - day)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city ?d1 - day ?n0 - count ?n1 - count)
    :precondition (and 
      (not_started) 
      (is_day_1 ?d1) 
      (visited_count ?c ?n0) 
      (succ ?n0 ?n1)
    )
    :effect (and 
      (not (not_started))
      (current_day ?d1)
      (current_city ?c)
      (at_city_day ?c ?d1)
      (not (visited_count ?c ?n0))
      (visited_count ?c ?n1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_prev - day ?d_now - day ?n_prev - count ?n_now - count)
    :precondition (and 
      (current_city ?c)
      (current_day ?d_prev)
      (next_day ?d_prev ?d_now)
      (visited_count ?c ?n_prev)
      (succ ?n_prev ?n_now)
    )
    :effect (and 
      (not (current_day ?d_prev))
      (current_day ?d_now)
      (at_city_day ?c ?d_now)
      (not (visited_count ?c ?n_prev))
      (visited_count ?c ?n_now)
    )
  )

  (:action travel
    :parameters (?from - city ?to - city ?d_prev - day ?d_now - day ?n_to_prev - count ?n_to_now - count)
    :precondition (and 
      (current_city ?from)
      (current_day ?d_prev)
      (next_day ?d_prev ?d_now)
      (flight ?from ?to)
      (visited_count ?to ?n_to_prev)
      (succ ?n_to_prev ?n_to_now)
    )
    :effect (and 
      (not (current_day ?d_prev))
      (current_day ?d_now)
      (not (current_city ?from))
      (current_city ?to)
      (at_city_day ?to ?d_now)
      (not (visited_count ?to ?n_to_prev))
      (visited_count ?to ?n_to_now)
    )
  )
)