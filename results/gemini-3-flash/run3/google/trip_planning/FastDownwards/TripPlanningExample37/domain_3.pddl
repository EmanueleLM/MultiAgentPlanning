(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (not_started)
  )

  (:action start
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and
      (not (not_started))
      (at ?c d1)
      (visited_count ?c n1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?n_from - count ?n_to - count)
    :precondition (and
      (at ?c ?d_from)
      (next_day ?d_from ?d_to)
      (visited_count ?c ?n_from)
      (next_count ?n_from ?n_to)
    )
    :effect (and
      (not (at ?c ?d_from))
      (at ?c ?d_to)
      (not (visited_count ?c ?n_from))
      (visited_count ?c ?n_to)
    )
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_from - day ?d_to - day ?n_to_old - count ?n_to_new - count)
    :precondition (and
      (at ?c_from ?d_from)
      (flight ?c_from ?c_to)
      (next_day ?d_from ?d_to)
      (visited_count ?c_to ?n_to_old)
      (next_count ?n_to_old ?n_to_new)
    )
    :effect (and
      (not (at ?c_from ?d_from))
      (at ?c_to ?d_to)
      (not (visited_count ?c_to ?n_to_old))
      (visited_count ?c_to ?n_to_new)
    )
  )
)