(define (domain trip-planning)
  (:requirements :strips :typing)
  (:types agent city day)
  (:predicates
    (at ?a - agent ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action stay
    :parameters (?a - agent ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?c ?d) (next ?d ?d2))
    :effect (and (at ?a ?c ?d2))
  )

  (:action fly
    :parameters (?a - agent ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?from ?d) (next ?d ?d2) (connected ?from ?to))
    :effect (and (at ?a ?to ?d2))
  )
)