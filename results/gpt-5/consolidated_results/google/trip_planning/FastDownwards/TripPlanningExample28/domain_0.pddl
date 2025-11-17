(define (domain trip-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at-city ?c - city)
    (at-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (last-day ?d - day)
    (scheduled ?d - day)
    (unscheduled ?d - day)
    (direct ?from - city ?to - city)
    (must-stay ?d - day ?c - city)
    (allowed-flight-at ?d - day ?from - city ?to - city)
    (pending-flight ?d - day)
  )

  (:action stay-and-advance
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at-city ?c)
      (at-day ?d)
      (must-stay ?d ?c)
      (next ?d ?d2)
      (unscheduled ?d)
      (not (pending-flight ?d))
    )
    :effect (and
      (scheduled ?d)
      (not (unscheduled ?d))
      (at-day ?d2)
      (not (at-day ?d))
    )
  )

  (:action stay-on-last
    :parameters (?c - city ?d - day)
    :precondition (and
      (at-city ?c)
      (at-day ?d)
      (must-stay ?d ?c)
      (last-day ?d)
      (unscheduled ?d)
      (not (pending-flight ?d))
    )
    :effect (and
      (scheduled ?d)
      (not (unscheduled ?d))
    )
  )

  (:action fly-allowed
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (at-day ?d)
      (unscheduled ?d)
      (pending-flight ?d)
      (allowed-flight-at ?d ?from ?to)
      (at-city ?from)
      (direct ?from ?to)
    )
    :effect (and
      (at-city ?to)
      (not (at-city ?from))
      (not (pending-flight ?d))
    )
  )
)