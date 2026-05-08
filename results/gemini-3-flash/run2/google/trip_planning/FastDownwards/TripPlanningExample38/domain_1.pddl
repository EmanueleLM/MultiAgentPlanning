(define (domain trip_planning_example_38)
  (:requirements :strips :typing :equality :existential-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 ?d2 - day)
    (can_fly ?c1 ?c2 - city)
    (visited ?c - city ?d - day)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and (not_started) (current_day d1))
    :effect (and (not (not_started)) (at ?c))
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and (not (not_started)) (at ?c) (current_day ?d) (next ?d ?nd))
    :effect (and (not (current_day ?d)) (current_day ?nd) (visited ?c ?d))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and (not (not_started)) (at ?from) (current_day ?d) (next ?d ?nd) (can_fly ?from ?to))
    :effect (and (not (at ?from)) (at ?to) (not (current_day ?d)) (current_day ?nd) (visited ?from ?d) (visited ?to ?d))
  )
)