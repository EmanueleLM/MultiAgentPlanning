(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visited_at ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (started)
  )

  ;; Action to arrive at the first city and begin the trip on day 1.
  (:action arrive
    :parameters (?c - city ?d1 ?d2 - day ?c0 ?c1 - count)
    :precondition (and 
      (not (started)) 
      (current_day ?d1) 
      (next_day ?d1 ?d2) 
      (stay_count ?c ?c0) 
      (next_count ?c0 ?c1)
    )
    :effect (and 
      (started) 
      (at_city ?c) 
      (visited_at ?c ?d1) 
      (not (stay_count ?c ?c0)) 
      (stay_count ?c ?c1) 
      (not (current_day ?d1)) 
      (current_day ?d2)
    )
  )

  ;; Action to stay in the current city for the duration of the current day.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and 
      (started) 
      (at_city ?c) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (stay_count ?c ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (visited_at ?c ?d_curr) 
      (not (stay_count ?c ?n_curr)) 
      (stay_count ?c ?n_next) 
      (not (current_day ?d_curr)) 
      (current_day ?d_next)
    )
  )

  ;; Action to fly to a new city and spend the current day there.
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and 
      (started) 
      (at_city ?from) 
      (can_fly ?from ?to) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (stay_count ?to ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (visited_at ?to ?d_curr) 
      (not (stay_count ?to ?n_curr)) 
      (stay_count ?to ?n_next) 
      (not (current_day ?d_curr)) 
      (current_day ?d_next)
    )
  )
)