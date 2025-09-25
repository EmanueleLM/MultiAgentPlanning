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
    (workshop-attended)
  )

  (:action traveler-stay-bucharest
    :parameters (?d - day ?next - day)
    :precondition (and
      (at-traveler bucharest)
      (current-day ?d)
      (next ?d ?next)
    )
    :effect (and
      (assigned ?d bucharest)
      (not (current-day ?d))
      (current-day ?next)
    )
  )

  (:action traveler-stay-frankfurt
    :parameters (?d - day ?next - day)
    :precondition (and
      (at-traveler frankfurt)
      (current-day ?d)
      (next ?d ?next)
    )
    :effect (and
      (assigned ?d frankfurt)
      (not (current-day ?d))
      (current-day ?next)
    )
  )

  (:action traveler-stay-stuttgart
    :parameters (?d - day ?next - day)
    :precondition (and
      (at-traveler stuttgart)
      (current-day ?d)
      (next ?d ?next)
    )
    :effect (and
      (assigned ?d stuttgart)
      (not (current-day ?d))
      (current-day ?next)
      (when (in-window ?d) (workshop-attended))
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