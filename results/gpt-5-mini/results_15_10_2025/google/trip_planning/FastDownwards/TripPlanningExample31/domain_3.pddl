(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)

  (:predicates
    (at ?d - day ?c - city)
    (connected ?from - city ?to - city)
    (next ?d - day ?d2 - day)
    (free ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?d ?c) (next ?d ?d2) (free ?d2))
    :effect (and (at ?d2 ?c) (not (free ?d2)))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?d ?from) (connected ?from ?to) (next ?d ?d2) (free ?d2))
    :effect (and (at ?d2 ?to) (not (free ?d2)))
  )
)