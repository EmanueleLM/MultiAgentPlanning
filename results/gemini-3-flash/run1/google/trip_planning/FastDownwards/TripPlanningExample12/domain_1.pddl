(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (day_count ?c - city ?n - count)
    (inc ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (visited ?c - city ?d - day)
  )

  ;; Stay in the current city for one day.
  ;; This action increments the day counter and the stay counter for the city.
  (:action stay
    :parameters (?c - city ?d - day ?dn - day ?cn - count ?cnn - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (next_day ?d ?dn) 
      (day_count ?c ?cn) 
      (inc ?cn ?cnn)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?dn) 
      (not (day_count ?c ?cn)) 
      (day_count ?c ?cnn) 
      (visited ?c ?d)
    )
  )

  ;; Fly from one city to another.
  ;; In this model, the travel day counts toward the duration of stay in both cities.
  ;; This allows fitting the total required stays (5+5+7=17) into the 15-day window.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day ?cfn - count ?cfnn - count ?ctn - count ?ctnn - count)
    :precondition (and 
      (at ?from) 
      (current_day ?d) 
      (next_day ?d ?dn) 
      (can_fly ?from ?to) 
      (day_count ?from ?cfn) 
      (inc ?cfn ?cfnn) 
      (day_count ?to ?ctn) 
      (inc ?ctn ?ctnn)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_day ?d)) 
      (current_day ?dn) 
      (not (day_count ?from ?cfn)) 
      (day_count ?from ?cfnn) 
      (not (day_count ?to ?ctn)) 
      (day_count ?to ?ctnn) 
      (visited ?from ?d) 
      (visited ?to ?d)
    )
  )
)