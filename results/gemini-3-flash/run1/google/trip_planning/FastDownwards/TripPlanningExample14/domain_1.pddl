(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day visit_step)
  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visit_count ?c - city ?s - visit_step)
    (next_step ?s1 - visit_step ?s2 - visit_step)
    (flight ?c1 - city ?c2 - city)
    (visited ?c - city ?d - day)
  )

  ;; Each day, the traveler can either stay in their current city or take a direct flight.
  ;; A stay action counts as one day spent in that city.
  (:action stay
    :parameters (?c - city ?d - day ?next_d - day ?curr_s - visit_step ?next_s - visit_step)
    :precondition (and 
      (at ?c ?d) 
      (next_day ?d ?next_d) 
      (visit_count ?c ?curr_s) 
      (next_step ?curr_s ?next_s)
    )
    :effect (and 
      (not (at ?c ?d)) 
      (at ?c ?next_d) 
      (not (visit_count ?c ?curr_s)) 
      (visit_count ?c ?next_s) 
      (visited ?c ?d)
    )
  )

  ;; A fly action counts as a day spent in both the departure and arrival cities 
  ;; (transition day overlap). This model allows satisfying 12 city-days in 10 calendar-days.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?next_d - day ?from_s - visit_step ?next_from_s - visit_step ?to_s - visit_step ?next_to_s - visit_step)
    :precondition (and 
      (at ?from ?d) 
      (next_day ?d ?next_d) 
      (flight ?from ?to) 
      (visit_count ?from ?from_s) 
      (next_step ?from_s ?next_from_s) 
      (visit_count ?to ?to_s) 
      (next_step ?to_s ?next_to_s)
    )
    :effect (and 
      (not (at ?from ?d)) 
      (at ?to ?next_d) 
      (not (visit_count ?from ?from_s)) 
      (visit_count ?from ?next_from_s) 
      (not (visit_count ?to ?to_s)) 
      (visit_count ?to ?next_to_s) 
      (visited ?from ?d) 
      (visited ?to ?d)
    )
  )
)