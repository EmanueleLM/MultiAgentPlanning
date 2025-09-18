(define (domain integrated-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from ?to - city)
    (at ?c - city ?d - day)
    (next ?d1 ?d2 - day)
    (assigned ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (not (assigned ?d2)))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2) (assigned ?d2))
  )

  (:action fly
    :parameters (?from ?to - city ?d1 ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2) (not (assigned ?d2)))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2) (assigned ?d2))
  )
)