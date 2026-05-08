(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day step_count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (visit_count ?c - city ?n - step_count)
    (next_count ?n1 ?n2 - step_count)
    (visited ?c - city ?d - day)
    (flight ?c1 ?c2 - city)
  )

  (:action record_visit
    :parameters (?c - city ?d - day ?n_old ?n_new - step_count)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (visit_count ?c ?n_old) 
      (next_count ?n_old ?n_new)
      (not (visited ?c ?d))
    )
    :effect (and 
      (not (visit_count ?c ?n_old)) 
      (visit_count ?c ?n_new) 
      (visited ?c ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and 
      (at ?from) 
      (flight ?from ?to) 
      (current_day ?d)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to)
    )
  )

  (:action advance_day
    :parameters (?d - day ?next_d - day)
    :precondition (and 
      (current_day ?d) 
      (next_day ?d ?next_d)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?next_d)
    )
  )
)