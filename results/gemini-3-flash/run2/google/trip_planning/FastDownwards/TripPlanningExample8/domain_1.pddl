(define (domain trip_planning_example8)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?c1 ?c2 - count)
    (stay_count ?c - city ?n - count)
    (day_stayed ?d - day ?c - city)
    (can_fly ?c1 ?c2 - city)
    (relatives_visited)
    (is_relatives_window ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?curr_q - count ?next_q - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (stay_count ?c ?curr_q) 
      (next_count ?curr_q ?next_q) 
      (not (day_stayed ?d ?c))
    )
    :effect (and 
      (stay_count ?c ?next_q) 
      (not (stay_count ?c ?curr_q)) 
      (day_stayed ?d ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and 
      (at ?from) 
      (can_fly ?from ?to)
    )
    :effect (and 
      (at ?to) 
      (not (at ?from))
    )
  )

  (:action advance_day
    :parameters (?curr - day ?next - day)
    :precondition (and 
      (current_day ?curr) 
      (next_day ?curr ?next)
    )
    :effect (and 
      (current_day ?next) 
      (not (current_day ?curr))
    )
  )

  (:action visit_relatives
    :parameters (?d - day)
    :precondition (and 
      (at athens) 
      (current_day ?d) 
      (is_relatives_window ?d)
    )
    :effect (and 
      (relatives_visited)
    )
  )
)