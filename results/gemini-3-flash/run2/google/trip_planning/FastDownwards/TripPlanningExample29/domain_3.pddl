(define (domain trip_planning_example_29)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visited_at ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight_route ?c1 ?c2 - city)
    (started)
    (is_day1 ?d - day)
    (is_count0 ?n - count)
  )

  (:action start_trip
    :parameters (?c - city ?d1 - day ?n0 - count ?n1 - count)
    :precondition (and 
      (not (started)) 
      (is_day1 ?d1) 
      (is_count0 ?n0) 
      (next_count ?n0 ?n1))
    :effect (and 
      (started) 
      (at_city ?c) 
      (current_day ?d1) 
      (visited_at ?c ?d1) 
      (city_count ?c ?n1))
  )

  (:action stay_city
    :parameters (?c - city ?d - day ?n_curr - count ?n_next - count)
    :precondition (and 
      (started) 
      (at_city ?c) 
      (current_day ?d) 
      (city_count ?c ?n_curr) 
      (next_count ?n_curr ?n_next) 
      (not (visited_at ?c ?d)))
    :effect (and 
      (visited_at ?c ?d) 
      (not (city_count ?c ?n_curr)) 
      (city_count ?c ?n_next))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n_curr - count ?n_next - count)
    :precondition (and 
      (started) 
      (at_city ?from) 
      (current_day ?d) 
      (flight_route ?from ?to) 
      (city_count ?to ?n_curr) 
      (next_count ?n_curr ?n_next) 
      (not (visited_at ?to ?d)))
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (visited_at ?to ?d) 
      (not (city_count ?to ?n_curr)) 
      (city_count ?to ?n_next))
  )

  (:action advance_day
    :parameters (?d_curr - day ?d_next - day)
    :precondition (and 
      (started) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next))
    :effect (and 
      (not (current_day ?d_curr)) 
      (current_day ?d_next))
  )
)