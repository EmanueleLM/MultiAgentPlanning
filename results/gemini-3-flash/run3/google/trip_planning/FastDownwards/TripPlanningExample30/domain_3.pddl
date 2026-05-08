(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (visited ?c - city ?d - day)
    (conn ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
  )

  ;; A fly action moves the traveler to a new city and immediately counts as a visit 
  ;; to the destination city on the current calendar day. 
  ;; This allows a single calendar day to be counted toward the stay requirements 
  ;; of both the origin and destination cities.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n_to - count ?nn_to - count)
    :precondition (and 
      (at ?from) 
      (conn ?from ?to)
      (current_day ?d)
      (stay_count ?to ?n_to)
      (next_count ?n_to ?nn_to)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to)
      (not (stay_count ?to ?n_to))
      (stay_count ?to ?nn_to)
      (visited ?to ?d)
    )
  )

  ;; A stay action advances the calendar day and increments the stay count 
  ;; for the city where the traveler is currently located.
  (:action stay_and_advance
    :parameters (?c - city ?d - day ?nd - day ?n - count ?nn - count)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (stay_count ?c ?n)
      (next_count ?n ?nn)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (stay_count ?c ?n))
      (stay_count ?c ?nn)
      (visited ?c ?nd)
    )
  )
)