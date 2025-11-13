(define (domain european-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at-city ?c - city)
    (at-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (last-day ?d - day)
    (scheduled ?d - day)
    (direct ?from - city ?to - city)
    (must-stay ?d - day ?c - city)
  )

  (:action advance-same-city
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at-city ?c)
      (at-day ?d)
      (next ?d ?d2)
      (must-stay ?d ?c)
      (must-stay ?d2 ?c)
      (not (scheduled ?d))
    )
    :effect (and
      (scheduled ?d)
      (at-day ?d2)
      (not (at-day ?d))
    )
  )

  (:action advance-with-flight
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at-city ?from)
      (at-day ?d)
      (next ?d ?d2)
      (must-stay ?d ?from)
      (must-stay ?d2 ?to)
      (direct ?from ?to)
      (not (scheduled ?d))
    )
    :effect (and
      (scheduled ?d)
      (not (at-city ?from))
      (at-city ?to)
      (at-day ?d2)
      (not (at-day ?d))
    )
  )

  (:action schedule-last-day
    :parameters (?c - city ?d - day)
    :precondition (and
      (at-city ?c)
      (at-day ?d)
      (last-day ?d)
      (must-stay ?d ?c)
      (not (scheduled ?d))
    )
    :effect (and
      (scheduled ?d)
    )
  )
)