(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (started)
    (first_day ?d - day)
    (is_last_day ?d - day)
    (trip_done)
  )

  (:action arrive
    :parameters (?c - city ?d1 - day ?n0 ?n1 - count)
    :precondition (and 
      (first_day ?d1) 
      (not (started)) 
      (visited_count ?c ?n0) 
      (next_count ?n0 ?n1)
    )
    :effect (and 
      (started) 
      (at ?c ?d1) 
      (not (visited_count ?c ?n0)) 
      (visited_count ?c ?n1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_from ?d_to - day ?n_old ?n_new - count)
    :precondition (and 
      (at ?c ?d_from) 
      (next_day ?d_from ?d_to) 
      (visited_count ?c ?n_old) 
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (not (at ?c ?d_from)) 
      (at ?c ?d_to) 
      (not (visited_count ?c ?n_old)) 
      (visited_count ?c ?n_new)
    )
  )

  (:action fly
    :parameters (?c_from ?c_to - city ?d_from ?d_to - day ?n_old ?n_new - count)
    :precondition (and 
      (at ?c_from ?d_from) 
      (next_day ?d_from ?d_to) 
      (flight ?c_from ?c_to) 
      (visited_count ?c_to ?n_old) 
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (not (at ?c_from ?d_from)) 
      (at ?c_to ?d_to) 
      (not (visited_count ?c_to ?n_old)) 
      (visited_count ?c_to ?n_new)
    )
  )

  (:action complete_trip
    :parameters (?c - city ?d - day)
    :precondition (and 
      (at ?c ?d) 
      (is_last_day ?d)
    )
    :effect (trip_done)
  )
)