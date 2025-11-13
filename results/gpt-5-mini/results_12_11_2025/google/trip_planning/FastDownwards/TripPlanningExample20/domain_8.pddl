(define (domain trip_planning_example20)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (served ?c - city ?d - day)
    (can_fly ?from - city ?to - city)
  )

  ;; Spend one whole day visiting a city: consumes the current day and
  ;; advances to the next day, and marks that city as served for that day.
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (current ?d) (at ?c) (next ?d ?d2))
    :effect (and
      (not (current ?d))
      (current ?d2)
      (served ?c ?d)
    )
  )

  ;; Instantaneous flight that changes location at the current day.
  ;; It does NOT advance the current day (flights are taken before the day's stay).
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (current ?d) (at ?from) (can_fly ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)