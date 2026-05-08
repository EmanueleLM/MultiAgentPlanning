(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (connected ?c1 ?c2 - city)
    (is_at_day ?c - city ?d - day)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and
      (not (not_started))
      (at ?c)
    )
  )

  (:action spend_day_staying
    :parameters (?c - city ?d - day ?d_next - day ?n - count ?n_next - count)
    :precondition (and
      (not (not_started))
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next)
      (stay_count ?c ?n)
      (next_count ?n ?n_next)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_count ?c ?n))
      (stay_count ?c ?n_next)
      (is_at_day ?c ?d)
    )
  )

  (:action spend_day_flying
    :parameters (?c_from - city ?c_to - city ?d - day ?d_next - day ?n - count ?n_next - count)
    :precondition (and
      (not (not_started))
      (at ?c_from)
      (connected ?c_from ?c_to)
      (current_day ?d)
      (next_day ?d ?d_next)
      (stay_count ?c_from ?n)
      (next_count ?n ?n_next)
    )
    :effect (and
      (not (at ?c_from))
      (at ?c_to)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (stay_count ?c_from ?n))
      (stay_count ?c_from ?n_next)
      (is_at_day ?c_from ?d)
    )
  )
)