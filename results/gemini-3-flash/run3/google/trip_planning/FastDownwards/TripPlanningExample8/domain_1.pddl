(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  ;; Stay in the same city while moving to the next day
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?n_curr - count ?n_next - count)
    :precondition (and 
      (at ?c ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (count ?c ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (at ?c ?d_curr)) 
      (at ?c ?d_next) 
      (not (count ?c ?n_curr)) 
      (count ?c ?n_next)
    )
  )

  ;; Fly from one city to another on the same day
  ;; The arrival day counts as the first day for the new city
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n_to_curr - count ?n_to_next - count)
    :precondition (and 
      (at ?from ?d) 
      (can_fly ?from ?to) 
      (count ?to ?n_to_curr) 
      (next_count ?n_to_curr ?n_to_next)
    )
    :effect (and 
      (not (at ?from ?d)) 
      (at ?to ?d) 
      (not (count ?to ?n_to_curr)) 
      (count ?to ?n_to_next)
    )
  )
)