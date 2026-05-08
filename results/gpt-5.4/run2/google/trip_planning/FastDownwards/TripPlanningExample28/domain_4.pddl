(define (domain tripplanningexample28)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (visited ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c)
      (current ?d)
      (next ?d ?d_next)
      (not (visited ?c ?d)))
    :effect (and
      (visited ?c ?d)
      (not (current ?d))
      (current ?d_next))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (at ?from)
      (current ?d)
      (next ?d ?d_next)
      (direct_flight ?from ?to)
      (not (visited ?from ?d)))
    :effect (and
      (visited ?from ?d)
      (not (at ?from))
      (at ?to)
      (not (current ?d))
      (current ?d_next))
  )
)