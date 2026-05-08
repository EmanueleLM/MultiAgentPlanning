(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (stay_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (can_stay_at ?c - city ?d - day)
  )

  ;; Flying between cities. 
  ;; Flying is assumed to be instantaneous in this model, 
  ;; so staying in a city for a day is the only way to advance the timeline.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at_city ?from) (can_fly ?from ?to))
    :effect (and (not (at_city ?from)) (at_city ?to))
  )

  ;; Spending a day in a city.
  ;; This action increments the stay count for the current city and advances the current day.
  ;; The can_stay_at predicate enforces conference constraints.
  (:action stay
    :parameters (?c - city ?d - day ?next_d - day ?n - count ?next_n - count)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d) 
      (next_day ?d ?next_d)
      (stay_count ?c ?n) 
      (next_count ?n ?next_n)
      (can_stay_at ?c ?d)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?next_d)
      (not (stay_count ?c ?n)) 
      (stay_count ?c ?next_n)
    )
  )
)