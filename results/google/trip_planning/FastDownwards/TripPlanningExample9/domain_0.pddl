(define (domain travel-multiagent)
  (:requirements :typing :fluels :fluents :conditional-effects :negative-preconditions)
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
  (:functions
    (spent-frankfurt)
    (spent-bucharest)
    (spent-stuttgart)
    (day-count)
  )

  ;; Traveler actions: staying in a city for one day (distinct actions per city)
  (:action traveler-stay-bucharest
    :parameters (?d - day ?next - day)
    :precondition (and
      (at-traveler bucharest)
      (current-day ?d)
      (next ?d ?next)
    )
    :effect (and
      (assigned ?d bucharest)
      (increase (spent-bucharest) 1)
      (increase (day-count) 1)
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
      (increase (spent-frankfurt) 1)
      (increase (day-count) 1)
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
      (increase (spent-stuttgart) 1)
      (increase (day-count) 1)
      (not (current-day ?d))
      (current-day ?next)
      ;; If this day is inside the workshop window, mark workshop-attended.
      (when (in-window ?d) (workshop-attended))
    )
  )

  ;; Flight actions provided by flight_scheduler agent.
  ;; Parameterized flight action enforces direct-flight constraint.
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