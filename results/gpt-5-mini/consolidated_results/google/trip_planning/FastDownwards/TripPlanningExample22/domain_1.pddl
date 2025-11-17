(define (domain itinerary)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (occupied ?d - day)
    (next ?d - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
    )
  )

  (:action travel
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (connected ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )
)