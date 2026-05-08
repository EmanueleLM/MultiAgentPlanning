(define (domain trip_planning_example_46)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (visit_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (can_be_at ?c - city ?d - day)
  )

  ;; Stay in the same city for the next day
  (:action stay
    :parameters (?d_from - day ?d_to - day ?c - city ?n_old - count ?n_new - count)
    :precondition (and
      (current_day ?d_from)
      (next_day ?d_from ?d_to)
      (at ?c ?d_from)
      (visit_count ?c ?n_old)
      (next_count ?n_old ?n_new)
      (can_be_at ?c ?d_to)
    )
    :effect (and
      (not (current_day ?d_from))
      (current_day ?d_to)
      (at ?c ?d_to)
      (not (visit_count ?c ?n_old))
      (visit_count ?c ?n_new)
    )
  )

  ;; Fly to a different city for the next day
  (:action fly
    :parameters (?d_from - day ?d_to - day ?c_from - city ?c_to - city ?n_old - count ?n_new - count)
    :precondition (and
      (current_day ?d_from)
      (next_day ?d_from ?d_to)
      (at ?c_from ?d_from)
      (flight ?c_from ?c_to)
      (visit_count ?c_to ?n_old)
      (next_count ?n_old ?n_new)
      (can_be_at ?c_to ?d_to)
    )
    :effect (and
      (not (current_day ?d_from))
      (current_day ?d_to)
      (at ?c_to ?d_to)
      (not (visit_count ?c_to ?n_old))
      (visit_count ?c_to ?n_new)
    )
  )
)