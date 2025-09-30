(define (domain trip-planning)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?d - day ?c - city)
    (flight ?c1 - city ?c2 - city)
    (succ ?d1 - day ?d2 - day)
  )
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and (at ?d ?c) (succ ?d ?d2) (not (at ?d2 ?c)))
    :effect (and (at ?d2 ?c))
  )
  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and (at ?d ?from) (succ ?d ?d2) (flight ?from ?to) (not (at ?d2 ?to)))
    :effect (and (at ?d2 ?to))
  )
)