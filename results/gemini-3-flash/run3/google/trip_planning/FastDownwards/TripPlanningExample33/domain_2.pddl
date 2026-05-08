(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day step)
  (:predicates 
    (at_city ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (count ?c - city ?s - step)
    (next_day ?d1 ?d2 - day)
    (next_step ?s1 ?s2 - step)
    (flight ?c1 ?c2 - city)
    (not_started)
    (is_day1 ?d - day)
  )

  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and (not_started) (is_day1 ?d))
    :effect (and (not (not_started)) (at_city ?c ?d))
  )

  (:action advance_day
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (at_city ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at_city ?c ?d1)) (at_city ?c ?d2))
  )

  (:action fly
    :parameters (?c1 ?c2 - city ?d - day)
    :precondition (and (at_city ?c1 ?d) (flight ?c1 ?c2))
    :effect (and (not (at_city ?c1 ?d)) (at_city ?c2 ?d))
  )

  (:action count_visit
    :parameters (?c - city ?d - day ?s1 ?s2 - step)
    :precondition (and (at_city ?c ?d) (not (visited ?c ?d)) (count ?c ?s1) (next_step ?s1 ?s2))
    :effect (and (not (count ?c ?s1)) (count ?c ?s2) (visited ?c ?d))
  )
)