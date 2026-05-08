(define (domain trip_planning_example_38)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (day_visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (started)
  )

  ;; Select the starting city for the trip on Day 1.
  (:action start_trip
    :parameters (?c - city)
    :precondition (not (started))
    :effect (and (started) (at ?c))
  )

  ;; Spend the current day in the current city.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?n_curr - count ?n_next - count)
    :precondition (and 
      (started)
      (at ?c)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (stay_count ?c ?n_curr)
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (stay_count ?c ?n_curr))
      (stay_count ?c ?n_next)
      (day_visited ?c ?d_curr)
    )
  )

  ;; Spend the current day traveling from one city to another.
  ;; This action counts as a stay day for both the origin and destination cities,
  ;; which allows fitting 7 required stay-days into a 5-day trip duration.
  (:action travel
    :parameters (
      ?c_from - city 
      ?c_to - city 
      ?d_curr - day 
      ?d_next - day 
      ?nf_curr - count 
      ?nf_next - count 
      ?nt_curr - count 
      ?nt_next - count
    )
    :precondition (and 
      (started)
      (at ?c_from)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (flight ?c_from ?c_to)
      (stay_count ?c_from ?nf_curr)
      (next_count ?nf_curr ?nf_next)
      (stay_count ?c_to ?nt_curr)
      (next_count ?nt_curr ?nt_next)
    )
    :effect (and 
      (not (at ?c_from))
      (at ?c_to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (stay_count ?c_from ?nf_curr))
      (stay_count ?c_from ?nf_next)
      (not (stay_count ?c_to ?nt_curr))
      (stay_count ?c_to ?nt_next)
      (day_visited ?c_from ?d_curr)
      (day_visited ?c_to ?d_curr)
    )
  )
)