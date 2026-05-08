(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (counted ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (is_first_day ?d - day)
    (started)
  )

  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and (not (started)) (is_first_day ?d))
    :effect (and (started) (at ?c ?d) (visited ?c ?d))
  )

  (:action stay
    :parameters (?c - city ?d_prev ?d_now - day)
    :precondition (and (at ?c ?d_prev) (next_day ?d_prev ?d_now))
    :effect (and (not (at ?c ?d_prev)) (at ?c ?d_now) (visited ?c ?d_now))
  )

  (:action fly
    :parameters (?from ?to - city ?d_prev ?d_now - day)
    :precondition (and (at ?from ?d_prev) (next_day ?d_prev ?d_now) (can_fly ?from ?to))
    :effect (and (not (at ?from ?d_prev)) (at ?to ?d_now) (visited ?from ?d_now) (visited ?to ?d_now))
  )

  (:action record_visit
    :parameters (?c - city ?d - day ?n_old ?n_new - count)
    :precondition (and (visited ?c ?d) (not (counted ?c ?d)) (city_count ?c ?n_old) (next_count ?n_old ?n_new))
    :effect (and (not (city_count ?c ?n_old)) (city_count ?c ?n_new) (counted ?c ?d))
  )
)