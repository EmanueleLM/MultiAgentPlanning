(define (domain trip_planning_example_46)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city)                         ;; The person is currently at city ?c
    (current_day ?d - day)                 ;; The current day of the trip
    (visit_count ?c - city ?n - count)     ;; Total number of days spent visiting city ?c
    (visited_at ?c - city ?d - day)        ;; The person visited city ?c on day ?d
    (next_day ?d1 ?d2 - day)               ;; Sequence of days
    (next_count ?n1 ?n2 - count)           ;; Sequence of integers for counting visits
    (flight ?c1 ?c2 - city)                ;; Available direct flight between cities
  )

  ;; Stay in the same city for the current day
  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?n_old - count ?n_new - count)
    :precondition (and
      (at ?c)
      (current_day ?d_from)
      (next_day ?d_from ?d_to)
      (visit_count ?c ?n_old)
      (next_count ?n_old ?n_new)
    )
    :effect (and
      (not (current_day ?d_from))
      (current_day ?d_to)
      (not (visit_count ?c ?n_old))
      (visit_count ?c ?n_new)
      (visited_at ?c ?d_from)
    )
  )

  ;; Fly from one city to another. The travel day counts as a visit for both the origin and destination.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_from - day ?d_to - day ?n_f_old - count ?n_f_new - count ?n_t_old - count ?n_t_new - count)
    :precondition (and
      (at ?c_from)
      (current_day ?d_from)
      (next_day ?d_from ?d_to)
      (flight ?c_from ?c_to)
      (visit_count ?c_from ?n_f_old)
      (next_count ?n_f_old ?n_f_new)
      (visit_count ?c_to ?n_t_old)
      (next_count ?n_t_old ?n_t_new)
    )
    :effect (and
      (not (at ?c_from))
      (at ?c_to)
      (not (current_day ?d_from))
      (current_day ?d_to)
      (not (visit_count ?c_from ?n_f_old))
      (visit_count ?c_from ?n_f_new)
      (not (visit_count ?c_to ?n_t_old))
      (visit_count ?c_to ?n_t_new)
      (visited_at ?c_from ?d_from)
      (visited_at ?c_to ?d_from)
    )
  )
)