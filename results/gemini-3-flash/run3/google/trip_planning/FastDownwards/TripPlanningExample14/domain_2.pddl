(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; Record that the person spent time in a city on the current day.
  ;; This increments the city's individual day counter and marks the day as visited.
  (:action spend_time
    :parameters (?c - city ?d - day ?n_old - count ?n_new - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (city_count ?c ?n_old) 
      (next_count ?n_old ?n_new)
      (not (visited ?c ?d))
    )
    :effect (and 
      (not (city_count ?c ?n_old)) 
      (city_count ?c ?n_new) 
      (visited ?c ?d)
    )
  )

  ;; Fly between cities on the current day. 
  ;; This changes the current location but does not advance the calendar day.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day)
    :precondition (and 
      (at ?c_from) 
      (current_day ?d) 
      (flight ?c_from ?c_to)
    )
    :effect (and 
      (not (at ?c_from)) 
      (at ?c_to)
    )
  )

  ;; Advance the calendar to the next day.
  (:action advance_day
    :parameters (?d_old - day ?d_new - day)
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