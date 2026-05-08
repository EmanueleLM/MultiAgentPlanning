(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited_on ?c - city ?d - day)
    (visited_count ?c - city ?n - count)
    (next ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (available_to_start)
    (is_d0 ?d - day)
  )

  (:action start
    :parameters (?c - city ?d0 ?d1 - day ?n0 ?n1 - count)
    :precondition (and (available_to_start) (is_d0 ?d0) (next ?d0 ?d1) (visited_count ?c ?n0) (next_count ?n0 ?n1))
    :effect (and (not (available_to_start)) (at ?c ?d1) (visited_on ?c ?d1) (visited_count ?c ?n1) (not (visited_count ?c ?n0)))
  )

  (:action stay
    :parameters (?c - city ?d_prev ?d_curr - day ?n_old ?n_new - count)
    :precondition (and (at ?c ?d_prev) (next ?d_prev ?d_curr) (visited_count ?c ?n_old) (next_count ?n_old ?n_new))
    :effect (and (not (at ?c ?d_prev)) (at ?c ?d_curr) (visited_on ?c ?d_curr) (visited_count ?c ?n_new) (not (visited_count ?c ?n_old)))
  )

  (:action fly
    :parameters (?c_from ?c_to - city ?d_prev ?d_curr - day ?n_f_old ?n_f_new ?n_t_old ?n_t_new - count)
    :precondition (and (at ?c_from ?d_prev) (next ?d_prev ?d_curr) (flight ?c_from ?c_to) (visited_count ?c_from ?n_f_old) (next_count ?n_f_old ?n_f_new) (visited_count ?c_to ?n_t_old) (next_count ?n_t_old ?n_t_new))
    :effect (and (not (at ?c_from ?d_prev)) (at ?c_to ?d_curr) (visited_on ?c_from ?d_curr) (visited_on ?c_to ?d_curr) (visited_count ?c_from ?n_f_new) (not (visited_count ?c_from ?n_f_old)) (visited_count ?c_to ?n_t_new) (not (visited_count ?c_to ?n_t_old)))
  )
)