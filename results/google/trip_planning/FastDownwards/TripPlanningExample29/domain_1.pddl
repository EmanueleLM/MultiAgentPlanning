(define (domain eurotrip-10days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city slot)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (flight ?from - city ?to - city)
    (assigned ?d - day)
    (slotfor ?s - slot ?c - city)
    (available ?s - slot)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city ?s - slot)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (slotfor ?s ?c)
      (available ?s)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
      (not (available ?s))
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?s - slot)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (flight ?from ?to)
      (slotfor ?s ?to)
      (available ?s)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
      (not (available ?s))
    )
  )
)