(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and
      (not (not_started))
      (at ?c day_1)
      (visited ?c day_1)
      (city_count ?c count_1)
    )
  )

  (:action stay
    :parameters (?c - city ?d_now ?d_next - day ?n_old ?n_new - count)
    :precondition (and
      (at ?c ?d_now)
      (next_day ?d_now ?d_next)
      (city_count ?c ?n_old)
      (next_count ?n_old ?n_new)
    )
    :effect (and
      (not (at ?c ?d_now))
      (at ?c ?d_next)
      (visited ?c ?d_next)
      (not (city_count ?c ?n_old))
      (city_count ?c ?n_new)
    )
  )

  (:action fly
    :parameters (?c_from ?c_to - city ?d_now ?d_next - day ?n_old ?n_new - count)
    :precondition (and
      (at ?c_from ?d_now)
      (next_day ?d_now ?d_next)
      (flight ?c_from ?c_to)
      (city_count ?c_to ?n_old)
      (next_count ?n_old ?n_new)
    )
    :effect (and
      (not (at ?c_from ?d_now))
      (at ?c_to ?d_next)
      (visited ?c_to ?d_next)
      (not (city_count ?c_to ?n_old))
      (city_count ?c_to ?n_new)
    )
  )
)