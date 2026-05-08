(define (domain trip_planner)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (flight ?from - city ?to - city)
    (succ ?d - day ?dnext - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (start_day ?d - day)
  )

  (:action start_at
    :parameters (?c - city ?d - day)
    :precondition (and (start_day ?d) (not (assigned ?d)))
    :effect (and (at ?c ?d) (assigned ?d))
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