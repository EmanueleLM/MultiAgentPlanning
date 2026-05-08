(define (domain trip_planning_example8)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (city_stay_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (connected ?c1 ?c2 - city)
    (can_visit ?c - city ?d - day)
  )

  ;; The 'stay' action represents spending a day in a city.
  ;; This action increments the stay count for that city and moves the current day forward.
  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day ?n_now - count ?n_next - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next)
      (city_stay_count ?c ?n_now) 
      (next_count ?n_now ?n_next)
      (can_visit ?c ?d_now)
    )
    :effect (and 
      (not (current_day ?d_now)) 
      (current_day ?d_next)
      (not (city_stay_count ?c ?n_now)) 
      (city_stay_count ?c ?n_next)
    )
  )

  ;; The 'fly' action represents traveling from one city to another.
  ;; In this model, the travel day counts as being in BOTH cities (overlap).
  ;; This increments the stay count for both the origin and the destination cities.
  (:action fly
    :parameters (?from - city ?to - city ?d_now - day ?d_next - day
                 ?n_from_now - count ?n_from_next - count
                 ?n_to_now - count ?n_to_next - count)
    :precondition (and 
      (at ?from) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next)
      (connected ?from ?to)
      (city_stay_count ?from ?n_from_now) 
      (next_count ?n_from_now ?n_from_next)
      (city_stay_count ?to ?n_to_now) 
      (next_count ?n_to_now ?n_to_next)
      (can_visit ?from ?d_now) 
      (can_visit ?to ?d_now)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to)
      (not (current_day ?d_now)) 
      (current_day ?d_next)
      (not (city_stay_count ?from ?n_from_now)) 
      (city_stay_count ?from ?n_from_next)
      (not (city_stay_count ?to ?n_to_now)) 
      (city_stay_count ?to ?n_to_next)
    )
  )
)