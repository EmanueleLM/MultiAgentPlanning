(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (visited ?c - city)
    (unassigned ?d - day)
  )

  (:action assign-first
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (unassigned ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (visited ?c)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (unassigned ?d2)
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?c)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (unassigned ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?to)
      (visited ?to)
    )
  )
)