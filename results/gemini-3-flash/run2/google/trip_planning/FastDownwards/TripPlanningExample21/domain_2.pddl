(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count_step)
  (:predicates
    (at ?c - city ?d - day)
    (spent ?c - city ?d - day)
    (day_recorded ?c - city ?d - day)
    (count ?c - city ?s - count_step)
    (next_day ?d1 ?d2 - day)
    (next_step ?s1 ?s2 - count_step)
    (can_fly ?c1 ?c2 - city)
    (is_first_day ?d - day)
    (trip_started)
  )

  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and (not (trip_started)) (is_first_day ?d))
    :effect (and (trip_started) (at ?c ?d) (spent ?c ?d))
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next_day ?d ?dn))
    :effect (and (not (at ?c ?d)) (at ?c ?dn) (spent ?c ?dn))
  )

  (:action fly
    :parameters (?cf - city ?ct - city ?d - day)
    :precondition (and (at ?cf ?d) (can_fly ?cf ?ct))
    :effect (and (not (at ?cf ?d)) (at ?ct ?d) (spent ?ct ?d))
  )

  (:action record_visit
    :parameters (?c - city ?d - day ?s1 - count_step ?s2 - count_step)
    :precondition (and (spent ?c ?d) (not (day_recorded ?c ?d)) (count ?c ?s1) (next_step ?s1 ?s2))
    :effect (and (not (count ?c ?s1)) (count ?c ?s2) (day_recorded ?c ?d))
  )
)