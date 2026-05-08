(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day visit_count)
  (:predicates
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (count_at ?c - city ?v - visit_count)
    (next_day ?d1 ?d2 - day)
    (next_count ?v1 ?v2 - visit_count)
    (connected ?c1 ?c2 - city)
  )

  (:action stay
    :parameters (?d_from ?d_to - day ?c - city ?v_old ?v_new - visit_count)
    :precondition (and
      (current_day ?d_from)
      (at ?c ?d_from)
      (next_day ?d_from ?d_to)
      (count_at ?c ?v_old)
      (next_count ?v_old ?v_new)
    )
    :effect (and
      (not (current_day ?d_from))
      (current_day ?d_to)
      (at ?c ?d_to)
      (not (count_at ?c ?v_old))
      (count_at ?c ?v_new)
    )
  )

  (:action move
    :parameters (?d_from ?d_to - day ?c_from ?c_to - city ?v_old ?v_new - visit_count)
    :precondition (and
      (current_day ?d_from)
      (at ?c_from ?d_from)
      (next_day ?d_from ?d_to)
      (connected ?c_from ?c_to)
      (count_at ?c_to ?v_old)
      (next_count ?v_old ?v_new)
    )
    :effect (and
      (not (current_day ?d_from))
      (current_day ?d_to)
      (at ?c_to ?d_to)
      (not (count_at ?c_to ?v_old))
      (count_at ?c_to ?v_new)
    )
  )
)