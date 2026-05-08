(define (domain trip)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
    (occupied ?p - person ?d - day)
  )

  (:action stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?c ?d1) (next ?d1 ?d2) (not (occupied ?p ?d2)))
    :effect (and (at ?p ?c ?d2) (occupied ?p ?d2))
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (not (occupied ?p ?d2)))
    :effect (and (at ?p ?to ?d2) (occupied ?p ?d2))
  )
)