(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city ?d - day)
    (spent_nights ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (increment ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (transitioned ?d1 ?d2 - day)
  )

  (:action fly
    :parameters (?c_from ?c_to - city ?d - day)
    :precondition (and (at_city ?c_from ?d) (can_fly ?c_from ?c_to))
    :effect (at_city ?c_to ?d)
  )

  (:action stay
    :parameters (?c - city ?d_from ?d_to - day ?n_from ?n_to - count)
    :precondition (and 
      (at_city ?c ?d_from) 
      (next_day ?d_from ?d_to) 
      (spent_nights ?c ?n_from) 
      (increment ?n_from ?n_to)
      (not (transitioned ?d_from ?d_to))
    )
    :effect (and 
      (at_city ?c ?d_to) 
      (spent_nights ?c ?n_to) 
      (not (spent_nights ?c ?n_from))
      (transitioned ?d_from ?d_to)
    )
  )
)