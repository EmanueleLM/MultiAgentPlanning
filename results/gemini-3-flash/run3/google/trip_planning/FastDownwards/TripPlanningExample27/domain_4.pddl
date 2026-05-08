(define (domain trip_planning_example_27)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (at_day ?c - city ?d - day)
    (at_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (started)
  )

  ;; Choose the starting city on Day 1
  (:action start_trip
    :parameters (?c - city ?d - day ?c0 - count ?c1 - count)
    :precondition (and (not (started)) (at_count ?c ?c0) (current_day ?d) (next_count ?c0 ?c1))
    :effect (and 
      (started) 
      (at ?c) 
      (at_day ?c ?d)
      (not (at_count ?c ?c0)) 
      (at_count ?c ?c1)
    )
  )

  ;; Stay in the current city for one more day, incrementing its visit count
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day ?c_old - count ?c_new - count)
    :precondition (and 
      (started)
      (at ?c) 
      (current_day ?d1) 
      (next_day ?d1 ?d2) 
      (at_count ?c ?c_old) 
      (next_count ?c_old ?c_new)
    )
    :effect (and 
      (not (current_day ?d1)) 
      (current_day ?d2) 
      (at_day ?c ?d2) 
      (not (at_count ?c ?c_old)) 
      (at_count ?c ?c_new)
    )
  )

  ;; Fly from one city to another. The arrival day counts toward the visit duration of both cities.
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?cf_old - count ?cf_new - count ?ct_old - count ?ct_new - count)
    :precondition (and 
      (started)
      (at ?from) 
      (can_fly ?from ?to)
      (current_day ?d1) 
      (next_day ?d1 ?d2) 
      (at_count ?from ?cf_old) 
      (next_count ?cf_old ?cf_new)
      (at_count ?to ?ct_old) 
      (next_count ?ct_old ?ct_new)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_day ?d1)) 
      (current_day ?d2) 
      (at_day ?from ?d2)
      (at_day ?to ?d2)
      (not (at_count ?from ?cf_old)) 
      (at_count ?from ?cf_new)
      (not (at_count ?to ?ct_old)) 
      (at_count ?to ?ct_new)
    )
  )
)