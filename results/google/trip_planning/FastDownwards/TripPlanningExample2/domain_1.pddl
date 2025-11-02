(define (domain trip-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (next ?d - day ?d2 - day)
    (at ?d - day ?c - city)
    (filled ?d - day)
    (connected ?from - city ?to - city)
    (allowed ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?d ?c)
      (next ?d ?d2)
      (not (filled ?d2))
      (allowed ?c ?d2)
    )
    :effect (and
      (at ?d2 ?c)
      (filled ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?d ?from)
      (connected ?from ?to)
      (next ?d ?d2)
      (not (filled ?d2))
      (allowed ?to ?d2)
    )
    :effect (and
      (at ?d2 ?to)
      (filled ?d2)
    )
  )
)