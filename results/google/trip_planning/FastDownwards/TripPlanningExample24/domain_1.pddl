(define (domain europe-trip)
  (:requirements :strips :typing :fluents :action-costs)
  (:types city day)
  (:predicates
    (on ?c - city ?d - day)
    (connected ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (free ?d - day)
  )
  (:functions
    (total-cost)
  )

  (:action assign-next
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (on ?from ?d1)
      (next ?d1 ?d2)
      (connected ?from ?to)
      (free ?d2)
    )
    :effect (and
      (on ?to ?d2)
      (not (free ?d2))
      (increase (total-cost) 1)
    )
  )
)