(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (next ?d - day ?dn - day)
    (connected ?c1 - city ?c2 - city)
  )

  (:action stay-in-city
    :parameters (?p - person ?c - city ?d - day ?dn - day)
    :precondition (and (at ?p ?c ?d) (next ?d ?dn))
    :effect (and (not (at ?p ?c ?d)) (at ?p ?c ?dn))
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?p ?from ?d) (next ?d ?dn) (connected ?from ?to))
    :effect (and (not (at ?p ?from ?d)) (at ?p ?to ?dn))
  )
)