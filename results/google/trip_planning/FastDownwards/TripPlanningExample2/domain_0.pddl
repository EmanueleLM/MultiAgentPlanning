(define (domain travel)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
  )

  ;; stay in the same city to advance one day
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  ;; fly along a direct flight to arrive the next day
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (flight ?from ?to) (next ?d1 ?d2))
    :effect (and (at ?to ?d2))
  )
)