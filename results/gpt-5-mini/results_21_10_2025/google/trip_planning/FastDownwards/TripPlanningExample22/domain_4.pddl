(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (next ?d - day ?dn - day)
  )

  (:action stay-in-city
    :parameters (?p - person ?c - city ?d - day ?dn - day)
    :precondition (and (at ?p ?c ?d) (next ?d ?dn))
    :effect (and (not (at ?p ?c ?d)) (at ?p ?c ?dn))
  )

  (:action fly-berlin-to-frankfurt
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p berlin ?d) (next ?d ?dn))
    :effect (and (not (at ?p berlin ?d)) (at ?p frankfurt ?dn))
  )

  (:action fly-frankfurt-to-berlin
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p frankfurt ?d) (next ?d ?dn))
    :effect (and (not (at ?p frankfurt ?d)) (at ?p berlin ?dn))
  )

  (:action fly-frankfurt-to-bucharest
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p frankfurt ?d) (next ?d ?dn))
    :effect (and (not (at ?p frankfurt ?d)) (at ?p bucharest ?dn))
  )

  (:action fly-bucharest-to-frankfurt
    :parameters (?p - person ?d - day ?dn - day)
    :precondition (and (at ?p bucharest ?d) (next ?d ?dn))
    :effect (and (not (at ?p bucharest ?d)) (at ?p frankfurt ?dn))
  )
)