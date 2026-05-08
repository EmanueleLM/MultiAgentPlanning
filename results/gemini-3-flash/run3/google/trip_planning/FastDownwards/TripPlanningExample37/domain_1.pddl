(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_val ?v1 ?v2 - count)
    (count_at ?c - city ?v - count)
    (flight ?c1 ?c2 - city)
    (not_started)
  )

  (:action start_reykjavik
    :parameters ()
    :precondition (not_started)
    :effect (and (not (not_started)) (at reykjavik d1) (count_at reykjavik n1) (not (count_at reykjavik n0)))
  )

  (:action start_milan
    :parameters ()
    :precondition (not_started)
    :effect (and (not (not_started)) (at milan d1) (count_at milan n1) (not (count_at milan n0)))
  )

  (:action start_porto
    :parameters ()
    :precondition (not_started)
    :effect (and (not (not_started)) (at porto d1) (count_at porto n1) (not (count_at porto n0)))
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?v_from - count ?v_to - count)
    :precondition (and (at ?c ?d_from) (next_day ?d_from ?d_to) (count_at ?c ?v_from) (next_val ?v_from ?v_to))
    :effect (and (not (at ?c ?d_from)) (at ?c ?d_to) (not (count_at ?c ?v_from)) (count_at ?c ?v_to))
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_from - day ?d_to - day ?v_from - count ?v_to - count)
    :precondition (and (at ?c_from ?d_from) (next_day ?d_from ?d_to) (flight ?c_from ?c_to) (count_at ?c_to ?v_from) (next_val ?v_from ?v_to))
    :effect (and (not (at ?c_from ?d_from)) (at ?c_to ?d_to) (not (count_at ?c_to ?v_from)) (count_at ?c_to ?v_to))
  )
)