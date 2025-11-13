(define (domain router-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day leg)

  (:predicates
    (city-on-day ?c - city ?d - day)
    (unassigned-day ?d - day)
    (direct-flight ?c1 - city ?c2 - city)
    (day-next ?d1 - day ?d2 - day)
    (flight-leg ?leg - leg ?c1 - city ?c2 - city)
    (flight-boundary ?leg - leg ?d1 - day ?d2 - day)
    (flight-done ?leg - leg)
  )

  ;; Assign a city to a day. Each day starts unassigned; this action consumes that fact
  ;; so at most one city can be assigned to a given day.
  (:action assign-city
    :parameters (?c - city ?d - day)
    :precondition (unassigned-day ?d)
    :effect (and
      (city-on-day ?c ?d)
      (not (unassigned-day ?d))
    )
  )

  ;; Take a specified flight leg at its specified day boundary.
  ;; Requires the source city on the previous day and the destination city on the next day,
  ;; the flight-leg definition, and an explicit boundary linking the two days.
  (:action take-flight
    :parameters (?leg - leg ?c1 - city ?c2 - city ?d1 - day ?d2 - day)
    :precondition (and
      (flight-leg ?leg ?c1 ?c2)
      (flight-boundary ?leg ?d1 ?d2)
      (city-on-day ?c1 ?d1)
      (city-on-day ?c2 ?d2)
      (not (flight-done ?leg))
    )
    :effect (and
      (flight-done ?leg)
    )
  )
)