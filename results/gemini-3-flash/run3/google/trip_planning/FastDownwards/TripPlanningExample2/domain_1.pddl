(define (domain trip_planning_example_2)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (can_fly ?c1 ?c2 - city)
    (day_count ?c - city ?n - count)
    (successor ?n1 ?n2 - count)
    (trip_started)
  )

  (:action start_trip
    :parameters (?c - city ?c0 ?c1 - count)
    :precondition (and (not (trip_started)) (day_count ?c ?c0) (successor ?c0 ?c1))
    :effect (and 
      (trip_started) 
      (at ?c day_01) 
      (not (day_count ?c ?c0)) 
      (day_count ?c ?c1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_from ?d_to - day ?n_old ?n_new - count)
    :precondition (and 
      (at ?c ?d_from) 
      (next_day ?d_from ?d_to) 
      (day_count ?c ?n_old) 
      (successor ?n_old ?n_new)
    )
    :effect (and 
      (not (at ?c ?d_from)) 
      (at ?c ?d_to) 
      (not (day_count ?c ?n_old)) 
      (day_count ?c ?n_new)
    )
  )

  (:action fly
    :parameters (?c_from ?c_to - city ?d_from ?d_to - day ?n_old ?n_new - count)
    :precondition (and 
      (at ?c_from ?d_from) 
      (next_day ?d_from ?d_to) 
      (can_fly ?c_from ?c_to) 
      (day_count ?c_to ?n_old) 
      (successor ?n_old ?n_new)
    )
    :effect (and 
      (not (at ?c_from ?d_from)) 
      (at ?c_to ?d_to) 
      (not (day_count ?c_to ?n_old)) 
      (day_count ?c_to ?n_new)
    )
  )
)