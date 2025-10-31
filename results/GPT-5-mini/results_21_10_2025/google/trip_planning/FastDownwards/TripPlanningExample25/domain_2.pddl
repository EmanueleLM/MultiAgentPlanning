(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day ?c - city)
    (free ?d - day)
    (has-slot ?s - slot ?c - city)
    (slot-available ?s - slot)
    (flight ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city ?s - slot)
    :precondition (and
      (assigned ?d ?c)
      (next ?d ?d2)
      (free ?d2)
      (has-slot ?s ?c)
      (slot-available ?s)
    )
    :effect (and
      (assigned ?d2 ?c)
      (not (free ?d2))
      (not (slot-available ?s))
    )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?c1 - city ?c2 - city ?s - slot)
    :precondition (and
      (assigned ?d ?c1)
      (next ?d ?d2)
      (free ?d2)
      (flight ?c1 ?c2)
      (has-slot ?s ?c2)
      (slot-available ?s)
    )
    :effect (and
      (assigned ?d2 ?c2)
      (not (free ?d2))
      (not (slot-available ?s))
    )
  )
)