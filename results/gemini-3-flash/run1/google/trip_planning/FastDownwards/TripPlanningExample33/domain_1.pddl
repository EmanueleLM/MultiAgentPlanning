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
    (flight ?c1 ?c2 - city)
    (last_day ?d - day)
    (trip_complete)
  )

  ;; Action to spend a full day in a city.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?c_curr - count ?c_next - count)
    :precondition (and 
      (at ?c)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (city_count ?c ?c_curr)
      (next_count ?c_curr ?c_next)
    )
    :effect (and 
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (city_count ?c ?c_curr))
      (city_count ?c ?c_next)
      (visited ?c ?d_curr)
    )
  )

  ;; Action to commute between cities. 
  ;; In this model, the travel day counts as a stay day for both the origin and destination cities.
  (:action fly
    :parameters (?from - city ?to - city ?d_curr - day ?d_next - day ?c_from_curr - count ?c_from_next - count ?c_to_curr - count ?c_to_next - count)
    :precondition (and 
      (at ?from)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (flight ?from ?to)
      (city_count ?from ?c_from_curr)
      (next_count ?c_from_curr ?c_from_next)
      (city_count ?to ?c_to_curr)
      (next_count ?c_to_curr ?c_to_next)
    )
    :effect (and 
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (city_count ?from ?c_from_curr))
      (city_count ?from ?c_from_next)
      (not (city_count ?to ?c_to_curr))
      (city_count ?to ?c_to_next)
      (visited ?from ?d_curr)
      (visited ?to ?d_curr)
    )
  )

  ;; Action to finalize the trip on the last day.
  (:action finish
    :parameters (?c - city ?d_last - day ?c_curr - count ?c_next - count)
    :precondition (and 
      (at ?c)
      (current_day ?d_last)
      (last_day ?d_last)
      (city_count ?c ?c_curr)
      (next_count ?c_curr ?c_next)
    )
    :effect (and 
      (not (city_count ?c ?c_curr))
      (city_count ?c ?c_next)
      (visited ?c ?d_last)
      (trip_complete)
    )
  )
)