(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (city_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (visited_day ?c - city ?d - day)
    (past_visit ?c - city)
    (can_fly ?c1 ?c2 - city)
    (not_started)
  )

  ;; Initialize the trip by choosing a starting city.
  (:action start_at
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and (not (not_started)) (at ?c))
  )

  ;; Move between cities if a direct flight exists.
  ;; Once an agent leaves a city, past_visit is marked, preventing them from returning.
  ;; This ensures contiguous occupancy for each city's stay.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and 
      (at ?from) 
      (can_fly ?from ?to) 
      (not (past_visit ?to))
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (past_visit ?from)
    )
  )

  ;; Visit the current city on the current day to increment the stay count.
  ;; Each city can be visited only once per calendar day.
  (:action visit
    :parameters (?c - city ?d - day ?n_old - count ?n_new - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (city_count ?c ?n_old) 
      (next_count ?n_old ?n_new) 
      (not (visited_day ?c ?d))
    )
    :effect (and 
      (visited_day ?c ?d) 
      (not (city_count ?c ?n_old)) 
      (city_count ?c ?n_new)
    )
  )

  ;; Progress the trip to the next calendar day.
  (:action advance_day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and 
      (current_day ?d1) 
      (next_day ?d1 ?d2)
    )
    :effect (and 
      (not (current_day ?d1)) 
      (current_day ?d2)
    )
  )
)