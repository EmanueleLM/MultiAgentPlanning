(define (domain travel-multiagent)
  (:requirements :typing :conditional-effects :negative-preconditions)
  (:types city day)
  (:predicates
    (at-traveler ?c - city)
    (current-day ?d - day)
    (next ?d1 ?d2 - day)
    (in-window ?d - day)
    (direct ?from ?to - city)
    (assigned ?d - day ?c - city)
    (workshop-city ?c - city)
    (workshop-attended)
  )

  (:action traveler-stay
    :parameters (?c - city ?d - day ?next - day)
    :precondition (and
      (at-traveler ?c)
      (current-day ?d)
      (next ?d ?next)
    )
    :effect (and
      (assigned ?d ?c)
      (not (current-day ?d))
      (current-day ?next)
      (when (and (in-window ?d) (workshop-city ?c)) (workshop-attended))
    )
  )

  (:action flight-scheduler-fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at-traveler ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (at-traveler ?from))
      (at-traveler ?to)
    )
  )
)