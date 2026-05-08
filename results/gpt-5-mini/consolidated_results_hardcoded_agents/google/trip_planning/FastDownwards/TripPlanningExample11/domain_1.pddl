(define (domain trip)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person city day)

  (:predicates
    (current-day ?d - day)
    (at ?p - person ?c - city ?d - day)
    (direct ?c1 - city ?c2 - city)
    (next ?d1 - day ?d2 - day)
  )

  (:action stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and (current-day ?d1) (next ?d1 ?d2) (at ?p ?c ?d1))
    :effect (and (not (current-day ?d1)) (current-day ?d2) (at ?p ?c ?d2))
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (current-day ?d1) (next ?d1 ?d2) (at ?p ?from ?d1) (direct ?from ?to))
    :effect (and (not (current-day ?d1)) (current-day ?d2) (at ?p ?to ?d2))
  )
)