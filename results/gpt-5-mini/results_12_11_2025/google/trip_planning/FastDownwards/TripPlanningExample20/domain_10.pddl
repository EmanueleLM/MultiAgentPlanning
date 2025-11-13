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
  ;; advances to the next day, marks that city as served for that day.
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (current ?d) (at ?c) (next ?d ?d2))
    :effect (and
      (not (current ?d))
      (current ?d2)
      (served ?c ?d)
    )
  )

  ;; Instantaneous flight that changes location without advancing the day.
  ;; Flights are allowed only along declared directed edges.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (can_fly ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)