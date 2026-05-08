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
    :precondition (and (not (started)) (current_day ?d) (at_count ?c ?c0) (next_count ?c0 ?c1))
    :effect (and 
      (started) 
      (at ?c) 
      (at_day ?c ?d) 
      (not (at_count ?c ?c0)) 
      (at_count ?c ?c1)
    )
  )

  ;; Stay in the current city for one more day
  (:action stay
    :parameters (?c - city ?d_today - day ?d_tomorrow - day ?c_today - count ?c_tomorrow - count)
    :precondition (and 
      (started)
      (at ?c) 
      (current_day ?d_today) 
      (next_day ?d_today ?d_tomorrow) 
      (at_count ?c ?c_today) 
      (next_count ?c_today ?c_tomorrow)
    )
    :effect (and 
      (not (current_day ?d_today)) 
      (current_day ?d_tomorrow) 
      (at_day ?c ?d_tomorrow) 
      (not (at_count ?c ?c_today)) 
      (at_count ?c ?c_tomorrow)
    )
  )

  ;; Fly from one city to another, counting the travel day for both
  (:action fly
    :parameters (?from - city ?to - city ?d_today - day ?d_tomorrow - day ?c_from_today - count ?c_from_tomorrow - count ?c_to_today - count ?c_to_tomorrow - count)
    :precondition (and 
      (started)
      (at ?from) 
      (current_day ?d_today) 
      (next_day ?d_today ?d_tomorrow) 
      (can_fly ?from ?to) 
      (at_count ?from ?c_from_today) 
      (next_count ?c_from_today ?c_from_tomorrow) 
      (at_count ?to ?c_to_today) 
      (next_count ?c_to_today ?c_to_tomorrow)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_day ?d_today)) 
      (current_day ?d_tomorrow) 
      (at_day ?from ?d_tomorrow) 
      (at_day ?to ?d_tomorrow) 
      (not (at_count ?from ?c_from_today)) 
      (at_count ?from ?c_from_tomorrow) 
      (not (at_count ?to ?c_to_today)) 
      (at_count ?to ?c_to_tomorrow)
    )
  )
)