(define (domain calendar-flight)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    day city
  )
  (:predicates
    (first ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct-flight ?c1 - city ?c2 - city)
    (at ?d - day ?c - city)
    (assigned ?d - day)
  )

  (:action assign_first
    :parameters (?d - day ?c - city)
    :precondition (and (first ?d) (not (assigned ?d)))
    :effect (and (at ?d ?c) (assigned ?d))
  )

  (:action advance_same
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  (:action advance_fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (direct-flight ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
    )
  )
)