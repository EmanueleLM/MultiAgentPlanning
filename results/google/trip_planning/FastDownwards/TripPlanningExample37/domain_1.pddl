(define (domain travel-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?a - agent ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?c ?d) (next ?d ?d2))
    :effect (and (at ?a ?c ?d2) (visited ?c))
  )

  (:action travel-direct
    :parameters (?a - agent ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?from ?d) (direct ?from ?to) (next ?d ?d2))
    :effect (and (at ?a ?to ?d2) (visited ?to))
  )
)