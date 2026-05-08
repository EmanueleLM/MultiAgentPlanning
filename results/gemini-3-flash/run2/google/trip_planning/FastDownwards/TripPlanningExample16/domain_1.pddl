(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (has_count ?c - city ?n - count)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  ;; Action to stay in the current city and progress to the next day.
  ;; This increments the city's visit count by one for the new day.
  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?n_before - count ?n_after - count)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d_from) 
      (next_day ?d_from ?d_to) 
      (has_count ?c ?n_before) 
      (next_count ?n_before ?n_after)
    )
    :effect (and 
      (not (current_day ?d_from)) 
      (current_day ?d_to) 
      (visited ?c ?d_to) 
      (not (has_count ?c ?n_before)) 
      (has_count ?c ?n_after)
    )
  )

  ;; Action to fly from one city to another on the current day.
  ;; This allows a single day to count for both the origin and destination cities.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n_before - count ?n_after - count)
    :precondition (and 
      (at_city ?from) 
      (current_day ?d) 
      (can_fly ?from ?to) 
      (has_count ?to ?n_before) 
      (next_count ?n_before ?n_after)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (visited ?to ?d) 
      (not (has_count ?to ?n_before)) 
      (has_count ?to ?n_after)
    )
  )
)