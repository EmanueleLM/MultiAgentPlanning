(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city
    day
    count
  )
  (:constants
    porto barcelona florence - city
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (spent_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (relatives_visited)
    (is_valid_relative_day ?d - day)
  )

  ;; Advance the city stay counter and the global time by one day.
  (:action spend_day
    :parameters (?c - city ?d - day ?nd - day ?cur_n - count ?next_n - count)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d) 
      (next_day ?d ?nd) 
      (spent_count ?c ?cur_n) 
      (next_count ?cur_n ?next_n)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?nd) 
      (not (spent_count ?c ?cur_n)) 
      (spent_count ?c ?next_n)
    )
  )

  ;; Move between cities via direct flights. Commuting does not advance the global day.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and 
      (at_city ?from) 
      (can_fly ?from ?to)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to)
    )
  )

  ;; Visit relatives in Porto (must be in Porto and within the specified time window).
  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and 
      (at_city porto) 
      (current_day ?d) 
      (is_valid_relative_day ?d)
    )
    :effect (relatives_visited)
  )
)