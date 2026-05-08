(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (adjacent ?c1 ?c2 - city)
  )

  ;; Record a stay in the current city on the current day.
  ;; This increments the city's visit counter.
  (:action visit
    :parameters (?c - city ?d - day ?n_old ?n_new - count)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d) 
      (not (visited ?c ?d)) 
      (stay_count ?c ?n_old) 
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (visited ?c ?d) 
      (not (stay_count ?c ?n_old)) 
      (stay_count ?c ?n_new)
    )
  )

  ;; Move between cities on the current day using a direct flight.
  ;; This allows a traveler to be at two cities on the same calendar day.
  (:action travel
    :parameters (?from ?to - city ?d - day)
    :precondition (and 
      (at_city ?from) 
      (current_day ?d) 
      (adjacent ?from ?to)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to)
    )
  )

  ;; Advance the calendar to the next day.
  (:action advance_day
    :parameters (?d_old ?d_new - day)
    :precondition (and 
      (current_day ?d_old) 
      (next_day ?d_old ?d_new)
    )
    :effect (and 
      (not (current_day ?d_old)) 
      (current_day ?d_new)
    )
  )
)