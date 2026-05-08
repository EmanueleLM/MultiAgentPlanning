(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (not_started)
    (current_day ?d - day)
    (count ?c - city ?n - count)
    (day_at ?d - day ?c - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (connected ?c1 ?c2 - city)
  )

  ;; Select the initial city to start the trip.
  (:action select_start_city
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and (not (not_started)) (at ?c))
  )

  ;; Travel between cities using a direct flight. 
  ;; This action is modeled as instantaneous to allow stay days to be the limiting resource.
  (:action fly
    :parameters (?from ?to - city)
    :precondition (and (at ?from) (connected ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Spend a day in a city. This increments the stay counter for that city 
  ;; and advances the timeline.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?c_curr ?c_next - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (count ?c ?c_curr) 
      (next_count ?c_curr ?c_next)
    )
    :effect (and 
      (not (current_day ?d_curr)) 
      (current_day ?d_next) 
      (not (count ?c ?c_curr)) 
      (count ?c ?c_next) 
      (day_at ?d_curr ?c)
    )
  )
)