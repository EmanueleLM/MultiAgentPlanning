(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next ?d1 ?d2 - day)
    (succ ?n1 ?n2 - count)
    (connected ?c1 ?c2 - city)
  )

  ;; Stay in the same city while transitioning to the next calendar day.
  ;; This increments the stay counter for the city because another day has been spent there.
  (:action stay_one_day
    :parameters (?c - city ?d_from - day ?d_to - day ?old_count - count ?new_count - count)
    :precondition (and 
      (at ?c ?d_from) 
      (next ?d_from ?d_to) 
      (stay_count ?c ?old_count) 
      (succ ?old_count ?new_count)
    )
    :effect (and 
      (not (at ?c ?d_from)) 
      (at ?c ?d_to) 
      (visited ?c ?d_to)
      (not (stay_count ?c ?old_count)) 
      (stay_count ?c ?new_count)
    )
  )

  ;; Take a direct flight between cities on the current calendar day.
  ;; This allows a single calendar day to count toward the stay duration of both cities.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?old_count - count ?new_count - count)
    :precondition (and 
      (at ?from ?d) 
      (connected ?from ?to) 
      (stay_count ?to ?old_count) 
      (succ ?old_count ?new_count)
    )
    :effect (and 
      (not (at ?from ?d)) 
      (at ?to ?d) 
      (visited ?to ?d)
      (not (stay_count ?to ?old_count)) 
      (stay_count ?to ?new_count)
    )
  )
)