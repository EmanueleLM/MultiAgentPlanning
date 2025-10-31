(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (not (at ?c ?d)) (at ?c ?d2) (visited ?c))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (connected ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d2) (visited ?to))
  )
)