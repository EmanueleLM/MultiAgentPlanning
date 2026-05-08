(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (is_city_at_day_allowed ?c - city ?d - day)
  )

  ;; Spending a day in a city.
  ;; This action increments the stay count for the current city and advances the timeline.
  ;; In this model, each stay action corresponds to one calendar day.
  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?n - count ?nn - count)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d) 
      (next_day ?d ?nd)
      (stay_count ?c ?n) 
      (next_count ?n ?nn)
      (is_city_at_day_allowed ?c ?d)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?nd)
      (not (stay_count ?c ?n)) 
      (stay_count ?c ?nn)
    )
  )

  ;; Flying between cities on a specific day.
  ;; Flying allows the traveler to spend part of the same day in two cities.
  ;; This counts as a visit day for both the origin and the destination cities,
  ;; while still advancing the calendar by only one day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day ?n1 - count ?nn1 - count ?n2 - count ?nn2 - count)
    :precondition (and 
      (at_city ?from) 
      (can_fly ?from ?to)
      (current_day ?d) 
      (next_day ?d ?nd)
      (stay_count ?from ?n1) 
      (next_count ?n1 ?nn1)
      (stay_count ?to ?n2) 
      (next_count ?n2 ?nn2)
      (is_city_at_day_allowed ?from ?d)
    )
    :effect (and 
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d)) 
      (current_day ?nd)
      (not (stay_count ?from ?n1)) 
      (stay_count ?from ?nn1)
      (not (stay_count ?to ?n2)) 
      (stay_count ?to ?nn2)
    )
  )
)