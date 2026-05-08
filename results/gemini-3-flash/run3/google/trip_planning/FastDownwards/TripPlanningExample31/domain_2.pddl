(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (flight ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city ?n0 - count ?n1 - count)
    :precondition (and 
      (not_started) 
      (city_count ?c ?n0)
      (next_count ?n0 ?n1)
    )
    :effect (and 
      (not (not_started)) 
      (at ?c d1) 
      (visited ?c d1) 
      (not (city_count ?c ?n0)) 
      (city_count ?c ?n1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?n_old - count ?n_new - count)
    :precondition (and 
      (at ?c ?d_from) 
      (next_day ?d_from ?d_to) 
      (city_count ?c ?n_old) 
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (not (at ?c ?d_from)) 
      (at ?c ?d_to) 
      (visited ?c ?d_to) 
      (not (city_count ?c ?n_old)) 
      (city_count ?c ?n_new)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d_from - day ?d_to - day ?n_f_old - count ?n_f_new - count ?n_t_old - count ?n_t_new - count)
    :precondition (and 
      (at ?from ?d_from) 
      (next_day ?d_from ?d_to) 
      (flight ?from ?to) 
      (city_count ?from ?n_f_old) 
      (next_count ?n_f_old ?n_f_new)
      (city_count ?to ?n_t_old)
      (next_count ?n_t_old ?n_t_new)
    )
    :effect (and 
      (not (at ?from ?d_from)) 
      (at ?to ?d_to) 
      (visited ?from ?d_to)
      (visited ?to ?d_to)
      (not (city_count ?from ?n_f_old)) 
      (city_count ?from ?n_f_new)
      (not (city_count ?to ?n_t_old))
      (city_count ?to ?n_t_new)
    )
  )
)