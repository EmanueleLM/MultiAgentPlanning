(define (domain travel-domain)
  (:requirements :typing)
  (:types agent city day)
  (:predicates
    (at ?a - agent ?c - city ?d - day)
    (flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
  )
  (:action stay
    :parameters (?a - agent ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?a ?c ?d2))
  )
  (:action fly
    :parameters (?a - agent ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?a ?from ?d1) (next ?d1 ?d2) (flight ?from ?to))
    :effect (and (at ?a ?to ?d2))
  )
)