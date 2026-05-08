(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (flight ?from - city ?to - city)
    (next ?d - day ?dn - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?dn)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?c ?dn)
      (assigned ?dn)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (at ?from ?d)
      (flight ?from ?to)
      (next ?d ?dn)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?to ?dn)
      (assigned ?dn)
    )
  )
)