(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (day_now ?d - day)
    (next_day ?d1 ?d2 - day)
    (spent ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  ;; Action to stay in the current city for one day.
  ;; This advances the day and increments the count for that city.
  (:action stay
    :parameters (?c - city ?d - day ?d_next - day ?n - count ?n_next - count)
    :precondition (and 
      (at ?c) 
      (day_now ?d) 
      (next_day ?d ?d_next) 
      (spent ?c ?n) 
      (next_count ?n ?n_next)
    )
    :effect (and 
      (not (day_now ?d)) 
      (day_now ?d_next) 
      (not (spent ?c ?n)) 
      (spent ?c ?n_next)
    )
  )

  ;; Action to fly from one city to another.
  ;; This advances the day and increments the count for BOTH the origin and destination city,
  ;; representing a travel day spent partially in both locations.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d_next - day ?n_from - count ?n_from_next - count ?n_to - count ?n_to_next - count)
    :precondition (and 
      (at ?from) 
      (can_fly ?from ?to) 
      (day_now ?d) 
      (next_day ?d ?d_next) 
      (spent ?from ?n_from) 
      (next_count ?n_from ?n_from_next) 
      (spent ?to ?n_to) 
      (next_count ?n_to ?n_to_next)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (day_now ?d)) 
      (day_now ?d_next) 
      (not (spent ?from ?n_from)) 
      (spent ?from ?n_from_next) 
      (not (spent ?to ?n_to)) 
      (spent ?to ?n_to_next)
    )
  )
)