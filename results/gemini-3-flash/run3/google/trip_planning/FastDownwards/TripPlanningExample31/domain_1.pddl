(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (visited ?c - city ?d - day)
    (flight ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city ?n1 - count)
    :precondition (and (not_started) (next_count n0 ?n1))
    :effect (and 
      (not (not_started)) 
      (at ?c d1) 
      (visited ?c d1) 
      (not (city_count ?c n0)) 
      (city_count ?c ?n1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?n_from - count ?n_to - count)
    :precondition (and 
      (at ?c ?d_from) 
      (next_day ?d_from ?d_to) 
      (city_count ?c ?n_from) 
      (next_count ?n_from ?n_to)
    )
    :effect (and 
      (not (at ?c ?d_from)) 
      (at ?c ?d_to) 
      (visited ?c ?d_to) 
      (not (city_count ?c ?n_from)) 
      (city_count ?c ?n_to)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d_from - day ?d_to - day ?n_to_before - count ?n_to_after - count)
    :precondition (and 
      (at ?from ?d_from) 
      (next_day ?d_from ?d_to) 
      (flight ?from ?to) 
      (city_count ?to ?n_to_before) 
      (next_count ?n_to_before ?n_to_after)
    )
    :effect (and 
      (not (at ?from ?d_from)) 
      (at ?to ?d_to) 
      (visited ?to ?d_to) 
      (not (city_count ?to ?n_to_before)) 
      (city_count ?to ?n_to_after)
    )
  )
)