(define (domain trip-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
    (decided ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (not (decided ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (decided ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (connected ?from ?to)
      (not (decided ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (decided ?d2)
    )
  )
)