(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (next ?d - day ?d2 - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (not (at ?c ?d)) (at ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (connected ?from ?to) (next ?d ?d2))
    :effect (and (not (at ?from ?d)) (at ?to ?d2))
  )
)