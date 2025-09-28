(define (domain trip-planning)
  (:requirements :typing :adl :negative-preconditions :conditional-effects)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (is-istanbul ?c - city)
    (is-tallinn ?c - city)
    (is-zurich ?c - city)
  )
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and
      (not (at ?from ?d1))
      (at ?to ?d2)
    )
  )
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and
      (not (at ?c ?d1))
      (at ?c ?d2)
    )
  )
)