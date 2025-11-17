(define (domain audited-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d - day ?d2 - day)
    (today ?d - day)
    (flight ?from - city ?to - city)
    (at-day ?d - day ?c - city)
    (current ?c - city)
    (start-chosen)
  )

  (:action choose-start
    :parameters (?c - city)
    :precondition (and (not (start-chosen)))
    :effect (and
      (start-chosen)
      (current ?c)
    )
  )

  (:action stay-same
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (start-chosen)
      (current ?c)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (at-day ?d ?c)
      (at-day ?d2 ?c)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action move
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (start-chosen)
      (current ?from)
      (flight ?from ?to)
      (today ?d)
      (next ?d ?d2)
    )
    :effect (and
      (at-day ?d ?from)
      (at-day ?d2 ?to)
      (not (today ?d))
      (today ?d2)
      (not (current ?from))
      (current ?to)
    )
  )
)