(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates 
    (at ?c - city ?d - day)
    (city_count ?c - city ?count - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?c1 ?c2 - count)
    (flight ?c1 ?c2 - city)
    (available)
  )

  (:action start
    :parameters (?c - city ?c0 - count ?c1 - count)
    :precondition (and (available) (city_count ?c ?c0) (next_count ?c0 ?c1))
    :effect (and (not (available)) (at ?c day1) (not (city_count ?c ?c0)) (city_count ?c ?c1))
  )

  (:action stay
    :parameters (?d_from - day ?d_to - day ?c - city ?count_old - count ?count_new - count)
    :precondition (and (at ?c ?d_from) (next_day ?d_from ?d_to) 
                       (city_count ?c ?count_old) (next_count ?count_old ?count_new))
    :effect (and (not (at ?c ?d_from)) (at ?c ?d_to)
                 (not (city_count ?c ?count_old)) (city_count ?c ?count_new))
  )

  (:action fly
    :parameters (?d_from - day ?d_to - day ?c_from - city ?c_to - city ?count_old - count ?count_new - count)
    :precondition (and (at ?c_from ?d_from) (next_day ?d_from ?d_to) (flight ?c_from ?c_to)
                       (city_count ?c_to ?count_old) (next_count ?count_old ?count_new))
    :effect (and (not (at ?c_from ?d_from)) (at ?c_to ?d_to)
                 (not (city_count ?c_to ?count_old)) (city_count ?c_to ?count_new))
  )
)