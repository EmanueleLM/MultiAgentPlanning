(define (domain trip-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day token)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
    (decided ?d - day)
    (unused ?t - token)
    (allowed ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (allowed ?c ?d2)
      (not (decided ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (decided ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day ?t - token)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (connected ?from ?to)
      (allowed ?to ?d2)
      (unused ?t)
      (not (decided ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (decided ?d2)
      (not (unused ?t))
    )
  )
)