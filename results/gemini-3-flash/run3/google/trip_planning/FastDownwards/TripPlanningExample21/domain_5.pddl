(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (total_visits ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?next_d - day ?n_old - count ?n_new - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (next_day ?d ?next_d)
      (total_visits ?c ?n_old) 
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?next_d)
      (not (total_visits ?c ?n_old)) 
      (total_visits ?c ?n_new)
      (visited ?c ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?next_d - day 
                 ?nf_old - count ?nf_new - count ?nt_old - count ?nt_new - count)
    :precondition (and 
      (at ?from) 
      (current_day ?d) 
      (next_day ?d ?next_d)
      (flight ?from ?to)
      (total_visits ?from ?nf_old) (next_count ?nf_old ?nf_new)
      (total_visits ?to ?nt_old) (next_count ?nt_old ?nt_new)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to)
      (not (current_day ?d)) 
      (current_day ?next_d)
      (not (total_visits ?from ?nf_old)) (total_visits ?from ?nf_new)
      (not (total_visits ?to ?nt_old)) (total_visits ?to ?nt_new)
      (visited ?from ?d) 
      (visited ?to ?d)
    )
  )
)