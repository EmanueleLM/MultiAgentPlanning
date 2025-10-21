(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day ?c - city)
    (occupied ?d - day)
    (has-slot ?s - slot ?c - city)
    (unavailable ?s - slot)
    (flight ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city ?s - slot)
    :precondition (and
      (assigned ?d ?c)
      (next ?d ?d2)
      (not (occupied ?d2))
      (has-slot ?s ?c)
      (not (unavailable ?s))
    )
    :effect (and
      (assigned ?d2 ?c)
      (occupied ?d2)
      (unavailable ?s)
    )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?c1 - city ?c2 - city ?s - slot)
    :precondition (and
      (assigned ?d ?c1)
      (next ?d ?d2)
      (not (occupied ?d2))
      (flight ?c1 ?c2)
      (has-slot ?s ?c2)
      (not (unavailable ?s))
    )
    :effect (and
      (assigned ?d2 ?c2)
      (occupied ?d2)
      (unavailable ?s)
    )
  )
)