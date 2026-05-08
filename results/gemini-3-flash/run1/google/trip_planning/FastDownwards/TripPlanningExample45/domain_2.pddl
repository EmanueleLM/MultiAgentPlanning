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
    (connected ?c1 ?c2 - city)
  )

  (:action visit
    :parameters (?c - city ?d - day ?n_before - count ?n_after - count)
    :precondition (and 
        (at ?c) 
        (current_day ?d) 
        (not (visited ?c ?d)) 
        (city_count ?c ?n_before) 
        (next_count ?n_before ?n_after)
    )
    :effect (and 
        (visited ?c ?d) 
        (not (city_count ?c ?n_before)) 
        (city_count ?c ?n_after)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and 
        (at ?from) 
        (connected ?from ?to)
    )
    :effect (and 
        (not (at ?from)) 
        (at ?to)
    )
  )

  (:action advance_day
    :parameters (?d_from - day ?d_to - day)
    :precondition (and 
        (current_day ?d_from) 
        (next_day ?d_from ?d_to)
    )
    :effect (and 
        (not (current_day ?d_from)) 
        (current_day ?d_to)
    )
  )
)