(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count_val)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (counted ?c - city ?d - day)
    (count ?c - city ?n - count_val)
    (can_fly ?c1 ?c2 - city)
    (next_day_order ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count_val)
    (trip_started)
  )

  ;; Initialize the trip at any city on the first day
  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and (not (trip_started)) (current_day ?d))
    :effect (and (trip_started) (at ?c) (visited ?c ?d))
  )

  ;; Fly between connected cities on the same day
  (:action fly
    :parameters (?from ?to - city ?d - day)
    :precondition (and (at ?from) (current_day ?d) (can_fly ?from ?to))
    :effect (and (not (at ?from)) (at ?to) (visited ?to ?d))
  )

  ;; Advance to the next day while staying in the current city
  (:action stay_to_next_day
    :parameters (?c - city ?d ?nd - day)
    :precondition (and (at ?c) (current_day ?d) (next_day_order ?d ?nd))
    :effect (and (not (current_day ?d)) (current_day ?nd) (visited ?c ?nd))
  )

  ;; Increment the visit count for a city on a specific day
  (:action record_visit
    :parameters (?c - city ?d - day ?n_old ?n_new - count_val)
    :precondition (and (visited ?c ?d) (count ?c ?n_old) (next_count ?n_old ?n_new) (not (counted ?c ?d)))
    :effect (and (not (count ?c ?n_old)) (count ?c ?n_new) (counted ?c ?d))
  )
)