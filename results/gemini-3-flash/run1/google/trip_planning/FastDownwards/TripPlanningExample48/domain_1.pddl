(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (current_day ?d - day)
    (flight ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (first_day ?d - day)
    (started)
  )

  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and (not (started)) (first_day ?d))
    :effect (and (at ?c ?d) (current_day ?d) (started))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (started) (current_day ?d1) (at ?from ?d1) (next ?d1 ?d2) (flight ?from ?to))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (at ?to ?d2))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (started) (current_day ?d1) (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (current_day ?d1)) (current_day ?d2) (at ?c ?d2))
  )
)