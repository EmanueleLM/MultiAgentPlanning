(define (domain trip_planning_example_16)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city ?d - day)                   ;; The traveler is currently at city ?c on day ?d
    (visited ?c - city ?d - day)              ;; City ?c has been visited at some point during day ?d
    (visit_recorded ?c - city ?d - day)       ;; The visit to city ?c on day ?d has been counted
    (visit_count ?c - city ?n - count)        ;; Total unique days city ?c has been visited
    (next_day ?d1 ?d2 - day)                  ;; Sequence of days in the trip
    (next_count ?n1 ?n2 - count)              ;; Sequence of integers for counting
    (flight ?c1 ?c2 - city)                   ;; Direct flight available between two cities
  )

  ;; Advance from one city to another on the same day via a direct flight.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and 
      (at ?from ?d) 
      (flight ?from ?to)
    )
    :effect (and 
      (not (at ?from ?d)) 
      (at ?to ?d) 
      (visited ?to ?d)
    )
  )

  ;; Advance to the next day while staying in the same city.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day)
    :precondition (and 
      (at ?c ?d_curr) 
      (next_day ?d_curr ?d_next)
    )
    :effect (and 
      (not (at ?c ?d_curr)) 
      (at ?c ?d_next) 
      (visited ?c ?d_next)
    )
  )

  ;; Record a visit to a city for a specific day.
  ;; This increments the city's total stay duration by one.
  (:action record_visit
    :parameters (?c - city ?d - day ?n_curr - count ?n_next - count)
    :precondition (and 
      (visited ?c ?d) 
      (not (visit_recorded ?c ?d)) 
      (visit_count ?c ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (visit_count ?c ?n_curr)) 
      (visit_count ?c ?n_next) 
      (visit_recorded ?c ?d)
    )
  )
)