(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:constants
    d1 - day
    n0 n1 - count
  )
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (visited_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_val ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (not_started)
  )

  (:action start
    :parameters (?c - city)
    :precondition (and (not_started) (visited_count ?c n0))
    :effect (and
      (not (not_started))
      (at ?c d1)
      (visited ?c d1)
      (not (visited_count ?c n0))
      (visited_count ?c n1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?v_from - count ?v_to - count)
    :precondition (and
      (at ?c ?d_from)
      (next_day ?d_from ?d_to)
      (visited_count ?c ?v_from)
      (next_val ?v_from ?v_to)
    )
    :effect (and
      (not (at ?c ?d_from))
      (at ?c ?d_to)
      (visited ?c ?d_to)
      (not (visited_count ?c ?v_from))
      (visited_count ?c ?v_to)
    )
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_from - day ?d_to - day ?v_to_old - count ?v_to_new - count)
    :precondition (and
      (at ?c_from ?d_from)
      (flight ?c_from ?c_to)
      (next_day ?d_from ?d_to)
      (visited_count ?c_to ?v_to_old)
      (next_val ?v_to_old ?v_to_new)
    )
    :effect (and
      (not (at ?c_from ?d_from))
      (at ?c_to ?d_to)
      (visited ?c_to ?d_to)
      (not (visited_count ?c_to ?v_to_old))
      (visited_count ?c_to ?v_to_new)
    )
  )
)