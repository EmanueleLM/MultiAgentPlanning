(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at_city ?c - city ?d - day)
    (current_day ?d - day)
    (current_count ?c - city ?n - count)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (can_fly ?c1 - city ?c2 - city)
    (not_started)
    (is_day_one ?d - day)
  )

  ;; Initialize the trip on Day 1 in any city, setting its stay count to 1.
  (:action start_trip
    :parameters (?c - city ?d1 - day ?c0 - count ?c1 - count)
    :precondition (and 
      (not_started) 
      (is_day_one ?d1) 
      (current_count ?c ?c0) 
      (next_count ?c0 ?c1)
    )
    :effect (and 
      (not (not_started)) 
      (current_day ?d1) 
      (at_city ?c ?d1) 
      (not (current_count ?c ?c0)) 
      (current_count ?c ?c1)
    )
  )

  ;; Stay in the current city for another day, incrementing its total stay count.
  (:action stay
    :parameters (?c - city ?d_prev - day ?d_curr - day ?c_prev - count ?c_curr - count)
    :precondition (and 
      (current_day ?d_prev) 
      (next_day ?d_prev ?d_curr) 
      (at_city ?c ?d_prev) 
      (current_count ?c ?c_prev) 
      (next_count ?c_prev ?c_curr)
    )
    :effect (and 
      (not (current_day ?d_prev)) 
      (current_day ?d_curr) 
      (at_city ?c ?d_curr) 
      (not (current_count ?c ?c_prev)) 
      (current_count ?c ?c_curr)
    )
  )

  ;; Fly from one city to another, incrementing the destination's stay count on the arrival day.
  (:action fly
    :parameters (?from - city ?to - city ?d_prev - day ?d_curr - day ?c_prev - count ?c_curr - count)
    :precondition (and 
      (current_day ?d_prev) 
      (next_day ?d_prev ?d_curr) 
      (at_city ?from ?d_prev) 
      (can_fly ?from ?to) 
      (current_count ?to ?c_prev) 
      (next_count ?c_prev ?c_curr)
    )
    :effect (and 
      (not (current_day ?d_prev)) 
      (current_day ?d_curr) 
      (at_city ?to ?d_curr) 
      (not (current_count ?to ?c_prev)) 
      (current_count ?to ?c_curr)
    )
  )
)