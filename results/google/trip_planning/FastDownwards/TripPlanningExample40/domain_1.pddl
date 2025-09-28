(define (domain trip-planning)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (flight ?from - city ?to - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (not (at ?c ?d)) (at ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (flight ?from ?to) (next ?d ?d2))
    :effect (and (not (at ?from ?d)) (at ?to ?d2))
  )
)