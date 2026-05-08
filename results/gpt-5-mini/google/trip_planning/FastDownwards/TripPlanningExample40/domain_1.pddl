(define (domain trip_planner)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (flight ?from - city ?to - city)
    (succ ?d - day ?dnext - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (start_available)
  )

  (:action start_at
    :parameters (?c - city)
    :precondition (and (start_available) (not (assigned day1)))
    :effect (and (at ?c day1) (assigned day1) (not (start_available)))
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and (at ?c ?d) (succ ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (at ?c ?dnext) (assigned ?dnext))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and (at ?from ?d) (succ ?d ?dnext) (flight ?from ?to) (not (assigned ?dnext)))
    :effect (and (at ?to ?dnext) (assigned ?dnext))
  )
)