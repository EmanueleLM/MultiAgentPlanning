(define (domain trip-planning-example4)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (adjacent ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (daycur ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?e - day)
    :precondition (and (at ?c ?d) (daycur ?d) (next ?d ?e))
    :effect (and (at ?c ?e) (not (daycur ?d)) (daycur ?e))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?e - day)
    :precondition (and (at ?from ?d) (daycur ?d) (next ?d ?e) (adjacent ?from ?to))
    :effect (and (at ?to ?e) (not (daycur ?d)) (daycur ?e))
  )
)