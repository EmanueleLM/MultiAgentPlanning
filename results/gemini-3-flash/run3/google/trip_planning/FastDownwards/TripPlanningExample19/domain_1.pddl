(define (domain trip_planning_example_19)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city ?d - day)
    (recorded ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (conn ?c1 - city ?c2 - city)
  )

  ;; Travel between cities on the current day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and 
      (at ?from ?d) 
      (conn ?from ?to)
    )
    :effect (and 
      (at ?to ?d) 
      (not (at ?from ?d))
    )
  )

  ;; Record staying in the current city on the current day.
  ;; This increments the city's stay counter and prevents double-counting the same day.
  (:action record_stay
    :parameters (?c - city ?d - day ?c_old - count ?c_new - count)
    :precondition (and 
      (at ?c ?d) 
      (stay_count ?c ?c_old) 
      (next_count ?c_old ?c_new) 
      (not (recorded ?c ?d))
    )
    :effect (and 
      (stay_count ?c ?c_new) 
      (not (stay_count ?c ?c_old)) 
      (recorded ?c ?d)
    )
  )

  ;; Advance to the next day while remaining in the same city.
  (:action advance_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and 
      (at ?c ?d1) 
      (next_day ?d1 ?d2)
    )
    :effect (and 
      (at ?c ?d2) 
      (not (at ?c ?d1))
    )
  )
)