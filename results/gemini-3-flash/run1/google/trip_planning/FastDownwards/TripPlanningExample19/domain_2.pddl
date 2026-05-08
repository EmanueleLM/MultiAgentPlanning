(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (day_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (not_started)
  )

  ;; Initialize the trip by picking the first city. This does not consume a day.
  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and 
      (not (not_started)) 
      (at ?c)
    )
  )

  ;; Spend the entire day in the current city. 
  ;; Consumes the current day ?d, increments the day_count for the city, and moves to day ?dn.
  (:action stay
    :parameters (?c - city ?d ?dn - day ?n ?nn - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (next_day ?d ?dn) 
      (day_count ?c ?n) 
      (next_count ?n ?nn)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?dn) 
      (not (day_count ?c ?n)) 
      (day_count ?c ?nn) 
      (visited ?c ?d)
    )
  )

  ;; Fly from one city to another. 
  ;; Following the convention for travel durations, the day of travel counts as a day spent in both the origin and the destination.
  ;; Consumes the current day ?d, increments counts for both cities, and moves to day ?dn.
  (:action fly
    :parameters (?f ?t - city ?d ?dn - day ?nf ?nfn ?nt ?ntn - count)
    :precondition (and 
      (at ?f) 
      (can_fly ?f ?t)
      (current_day ?d) 
      (next_day ?d ?dn) 
      (day_count ?f ?nf) 
      (next_count ?nf ?nfn)
      (day_count ?t ?nt) 
      (next_count ?nt ?ntn)
    )
    :effect (and 
      (not (at ?f)) 
      (at ?t) 
      (not (current_day ?d)) 
      (current_day ?dn) 
      (not (day_count ?f ?nf)) 
      (day_count ?f ?nfn)
      (not (day_count ?t ?nt)) 
      (day_count ?t ?ntn)
      (visited ?f ?d) 
      (visited ?t ?d)
    )
  )
)