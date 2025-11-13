(define (domain trip-planning-16days)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day city token
  )
  (:predicates
    (first ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct-flight ?c1 - city ?c2 - city)
    (allowed ?d - day ?c - city)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (token-city ?t - token ?c - city)
    (unused ?t - token)
  )

  (:action assign_first
    :parameters (?d - day ?c - city ?t - token)
    :precondition (and
      (first ?d)
      (not (assigned ?d))
      (allowed ?d ?c)
      (token-city ?t ?c)
      (unused ?t)
    )
    :effect (and
      (at ?d ?c)
      (assigned ?d)
      (not (unused ?t))
    )
  )

  (:action advance_same
    :parameters (?d1 - day ?d2 - day ?c - city ?t - token)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
      (allowed ?d2 ?c)
      (token-city ?t ?c)
      (unused ?t)
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
      (not (unused ?t))
    )
  )

  (:action advance_fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?t - token)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (direct-flight ?from ?to)
      (not (assigned ?d2))
      (allowed ?d2 ?to)
      (token-city ?t ?to)
      (unused ?t)
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
      (not (unused ?t))
    )
  )
)