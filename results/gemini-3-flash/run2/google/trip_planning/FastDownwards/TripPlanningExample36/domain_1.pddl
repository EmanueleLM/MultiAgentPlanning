(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (day_marked ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (can_fly ?c1 - city ?c2 - city)
  )

  (:action mark_stay
    :parameters (?c - city ?d - day ?n_old - count ?n_new - count)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d) 
      (stay_count ?c ?n_old) 
      (next_count ?n_old ?n_new) 
      (not (day_marked ?c ?d))
    )
    :effect (and 
      (not (stay_count ?c ?n_old)) 
      (stay_count ?c ?n_new) 
      (day_marked ?c ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and 
      (at_city ?from) 
      (can_fly ?from ?to)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to)
    )
  )

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