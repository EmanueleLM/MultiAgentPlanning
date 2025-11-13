(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (succ ?d1 - day ?d2 - day)
    (assigned ?d - day)
    (direct ?from - city ?to - city)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (succ ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (assigned ?d2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (succ ?d1 ?d2)
      (direct ?from ?to)
      (not (assigned ?d2))
      (not (visited ?to))
    )
    :effect (and
      (at ?to ?d2)
      (assigned ?d2)
      (visited ?to)
    )
  )
)