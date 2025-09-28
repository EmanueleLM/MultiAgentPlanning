(define (domain trip_planning_domain_14)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (in ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (in ?c ?d1) (next ?d1 ?d2))
    :effect (and (in ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (in ?from ?d1) (next ?d1 ?d2) (direct ?from ?to))
    :effect (and (in ?to ?d2))
  )
)