(define (domain trip_planning_example_32)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (at_city_day ?c - city ?d - day)
    (visited_count ?c - city ?n - count)
    (next_day ?d1 - day ?d2 - day)
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
      (at_city ?c)
      (at_city_day ?c ?d1)
      (not (visited_count ?c ?n0))
      (visited_count ?c ?n1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_prev - day ?d_now - day ?n_old - count ?n_new - count)
    :precondition (and 
      (at_city ?c)
      (current_day ?d_prev)
      (next_day ?d_prev ?d_now)
      (visited_count ?c ?n_old)
      (succ ?n_old ?n_new)
    )
    :effect (and 
      (not (current_day ?d_prev))
      (current_day ?d_now)
      (at_city_day ?c ?d_now)
      (not (visited_count ?c ?n_old))
      (visited_count ?c ?n_new)
    )
  )

  (:action travel
    :parameters (?from - city ?to - city ?d_prev - day ?d_now - day ?nf_old - count ?nf_new - count ?nt_old - count ?nt_new - count)
    :precondition (and 
      (at_city ?from)
      (current_day ?d_prev)
      (next_day ?d_prev ?d_now)
      (flight ?from ?to)
      (visited_count ?from ?nf_old)
      (succ ?nf_old ?nf_new)
      (visited_count ?to ?nt_old)
      (succ ?nt_old ?nt_new)
    )
    :effect (and 
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d_prev))
      (current_day ?d_now)
      (at_city_day ?from ?d_now)
      (at_city_day ?to ?d_now)
      (not (visited_count ?from ?nf_old))
      (visited_count ?from ?nf_new)
      (not (visited_count ?to ?nt_old))
      (visited_count ?to ?nt_new)
    )
  )
)