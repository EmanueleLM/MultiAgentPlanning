(define (domain trip_planning_example20)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (served ?c - city ?d - day)
    (can_fly ?from - city ?to - city)
    (flight_available ?d - day)
  )

  ;; Spend one whole day visiting a city: consumes the current day and
  ;; advances to the next day, marks that city as served for that day,
  ;; and re-enables flight availability for the next day.
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (current ?d) (at ?c) (next ?d ?d2))
    :effect (and
      (not (current ?d))
      (current ?d2)
      (served ?c ?d)
      (flight_available ?d2)
    )
  )

  ;; Instantaneous flight that changes location on the current day.
  ;; A flight can be taken at most once per day (flight_available enforces this).
  ;; Flights do not advance the day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (current ?d) (at ?from) (can_fly ?from ?to) (flight_available ?d))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (flight_available ?d))
    )
  )
)