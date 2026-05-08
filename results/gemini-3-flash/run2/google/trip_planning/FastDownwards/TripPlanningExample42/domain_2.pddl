(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at_city ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (day_count ?c - city ?n - count)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (has_flight ?c1 - city ?c2 - city)
  )

  ;; Stay in the current city for one day.
  ;; Increases the day counter and the stay counter for that city.
  (:action stay
    :parameters (?c - city ?d - day ?next_d - day ?old_n - count ?new_n - count)
    :precondition (and 
      (at_city ?c ?d)
      (next_day ?d ?next_d)
      (day_count ?c ?old_n)
      (next_count ?old_n ?new_n)
    )
    :effect (and 
      (not (at_city ?c ?d))
      (at_city ?c ?next_d)
      (not (day_count ?c ?old_n))
      (day_count ?c ?new_n)
      (visited ?c ?d)
    )
  )

  ;; Fly from one city to another.
  ;; The flight day counts as a stay day for BOTH the departure and arrival cities.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?next_d - day ?old_nf - count ?new_nf - count ?old_nt - count ?new_nt - count)
    :precondition (and 
      (at_city ?from ?d)
      (next_day ?d ?next_d)
      (has_flight ?from ?to)
      (day_count ?from ?old_nf)
      (next_count ?old_nf ?new_nf)
      (day_count ?to ?old_nt)
      (next_count ?old_nt ?new_nt)
    )
    :effect (and 
      (not (at_city ?from ?d))
      (at_city ?to ?next_d)
      (not (day_count ?from ?old_nf))
      (day_count ?from ?new_nf)
      (not (day_count ?to ?old_nt))
      (day_count ?to ?new_nt)
      (visited ?from ?d)
      (visited ?to ?d)
    )
  )
)