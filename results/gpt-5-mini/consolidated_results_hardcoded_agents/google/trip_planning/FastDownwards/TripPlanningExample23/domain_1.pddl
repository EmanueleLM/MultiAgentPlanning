(define (domain trip-planning)
  (:requirements :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (unassigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn) (unassigned ?dn))
    :effect (and (at ?c ?dn) (assigned ?dn) (not (unassigned ?dn)))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from ?d) (next ?d ?dn) (unassigned ?dn) (direct ?from ?to))
    :effect (and (at ?to ?dn) (assigned ?dn) (not (unassigned ?dn)))
  )
)