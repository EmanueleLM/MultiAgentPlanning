(define (domain trip_planning_example_46)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city)                         ;; The person is currently in city ?c
    (at_day ?c - city ?d - day)             ;; The person is in city ?c on day ?d
    (current_day ?d - day)                 ;; The current day of the trip
    (visit_count ?c - city ?n - count)      ;; Total days spent in city ?c
    (next_day ?d1 ?d2 - day)               ;; Sequence of days
    (next_count ?n1 ?n2 - count)           ;; Sequence of integers for counting
    (flight ?c1 ?c2 - city)                ;; Available direct flight between cities
  )

  ;; Stay in the same city for the next day
  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?n_old - count ?n_new - count)
    :precondition (and
      (current_day ?d_from)
      (next_day ?d_from ?d_to)
      (at ?c)
      (visit_count ?c ?n_old)
      (next_count ?n_old ?n_new)
    )
    :effect (and
      (not (current_day ?d_from))
      (current_day ?d_to)
      (not (visit_count ?c ?n_old))
      (visit_count ?c ?n_new)
      (at_day ?c ?d_to)
    )
  )

  ;; Fly to a different city for the next day
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_from - day ?d_to - day ?n_old - count ?n_new - count)
    :precondition (and
      (current_day ?d_from)
      (next_day ?d_from ?d_to)
      (at ?c_from)
      (flight ?c_from ?c_to)
      (visit_count ?c_to ?n_old)
      (next_count ?n_old ?n_new)
    )
    :effect (and
      (not (current_day ?d_from))
      (current_day ?d_to)
      (not (at ?c_from))
      (at ?c_to)
      (not (visit_count ?c_to ?n_old))
      (visit_count ?c_to ?n_new)
      (at_day ?c_to ?d_to)
    )
  )
)