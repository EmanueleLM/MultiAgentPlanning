(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day visit_count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (count_at ?c - city ?v - visit_count)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?v1 ?v2 - visit_count)
    (connected ?c1 ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d_old ?d_new - day ?v_old ?v_new - visit_count)
    :precondition (and
      (at ?c)
      (current_day ?d_old)
      (next_day ?d_old ?d_new)
      (count_at ?c ?v_old)
      (next_count ?v_old ?v_new)
    )
    :effect (and
      (not (current_day ?d_old))
      (current_day ?d_new)
      (not (count_at ?c ?v_old))
      (count_at ?c ?v_new)
      (visited ?c ?d_new)
    )
  )

  (:action fly
    :parameters (?from ?to - city ?d - day ?v_old ?v_new - visit_count)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (connected ?from ?to)
      (count_at ?to ?v_old)
      (next_count ?v_old ?v_new)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (count_at ?to ?v_old))
      (count_at ?to ?v_new)
      (visited ?to ?d)
    )
  )
)