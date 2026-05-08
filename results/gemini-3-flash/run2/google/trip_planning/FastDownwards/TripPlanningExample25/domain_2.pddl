(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (city_count ?c - city ?n - count)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  ;; Stay in a city for one day.
  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day ?c_now - count ?c_next - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next) 
      (city_count ?c ?c_now) 
      (next_count ?c_now ?c_next)
    )
    :effect (and 
      (not (current_day ?d_now)) 
      (current_day ?d_next) 
      (not (city_count ?c ?c_now)) 
      (city_count ?c ?c_next) 
      (visited ?c ?d_now)
    )
  )

  ;; Fly between two cities. The transition day counts as a stay in both the origin and destination.
  (:action fly
    :parameters (?from - city ?to - city ?d_now - day ?d_next - day ?c_from_now - count ?c_from_next - count ?c_to_now - count ?c_to_next - count)
    :precondition (and 
      (at ?from) 
      (can_fly ?from ?to) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next) 
      (city_count ?from ?c_from_now) 
      (next_count ?c_from_now ?c_from_next) 
      (city_count ?to ?c_to_now) 
      (next_count ?c_to_now ?c_to_next)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_day ?d_now)) 
      (current_day ?d_next) 
      (not (city_count ?from ?c_from_now)) 
      (city_count ?from ?c_from_next) 
      (not (city_count ?to ?c_to_now)) 
      (city_count ?to ?c_to_next) 
      (visited ?from ?d_now) 
      (visited ?to ?d_now)
    )
  )
)