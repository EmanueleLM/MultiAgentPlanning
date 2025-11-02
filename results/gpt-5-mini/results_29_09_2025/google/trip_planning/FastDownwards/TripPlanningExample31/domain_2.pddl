(define (domain trip-planning)
  (:requirements :strips :adl :typing :negative-preconditions :equality)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (current ?d - day)
    (next ?d - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (current ?d) (next ?d ?d2))
    :effect (and (not (at ?c ?d)) (at ?c ?d2) (not (current ?d)) (current ?d2) (visited ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (current ?d) (next ?d ?d2) (flight ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d2) (not (current ?d)) (current ?d2) (visited ?to ?d2))
  )
)