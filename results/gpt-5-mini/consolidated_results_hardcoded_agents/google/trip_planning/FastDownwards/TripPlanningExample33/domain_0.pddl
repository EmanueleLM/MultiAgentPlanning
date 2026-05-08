(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
    (free ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (free ?d2))
    :effect (and (at ?c ?d2) (not (free ?d2)))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (flight ?from ?to) (free ?d2))
    :effect (and (at ?to ?d2) (not (free ?d2)))
  )
)