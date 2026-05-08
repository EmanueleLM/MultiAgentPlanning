(define (domain travel-domain)
  (:requirements :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (at ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (connected ?from ?to))
    :effect (and (at ?to ?d2))
  )
)