(define (domain travel-domain)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (direct ?from - city ?to - city)
    (occupied ?p - person ?d - day)
  )

  (:action stay
    :parameters (?p - person ?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?p ?c ?d)
      (next ?d ?d2)
      (not (occupied ?p ?d2))
    )
    :effect (and
      (at ?p ?c ?d2)
      (occupied ?p ?d2)
    )
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?p ?from ?d)
      (next ?d ?d2)
      (direct ?from ?to)
      (not (occupied ?p ?d2))
    )
    :effect (and
      (at ?p ?to ?d2)
      (occupied ?p ?d2)
    )
  )
)