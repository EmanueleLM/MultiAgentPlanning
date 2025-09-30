(define (domain trip-domain)
  (:requirements :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (at ?d1 ?c) (next ?d1 ?d2))
    :effect (and (not (at ?d1 ?c)) (at ?d2 ?c))
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (at ?d1 ?from) (flight ?from ?to) (next ?d1 ?d2))
    :effect (and (not (at ?d1 ?from)) (at ?d2 ?to))
  )
)