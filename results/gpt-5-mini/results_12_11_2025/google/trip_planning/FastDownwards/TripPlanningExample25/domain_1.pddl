(define (domain itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (flight ?c1 - city ?c2 - city)
    (at-day ?d - day ?c - city)
  )

  (:action choose-start
    :parameters (?d - day ?c - city)
    :precondition (today ?d)
    :effect (at-day ?d ?c)
  )

  (:action stay-same
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and (next ?d ?d2) (at-day ?d ?c))
    :effect (at-day ?d2 ?c)
  )

  (:action move
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and (next ?d ?d2) (at-day ?d ?from) (flight ?from ?to))
    :effect (at-day ?d2 ?to)
  )
)