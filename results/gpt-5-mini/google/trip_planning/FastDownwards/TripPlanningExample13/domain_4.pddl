(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; calendar relations
    (first_day ?d - day)
    (next ?d1 - day ?d2 - day)

    ;; day assignment bookkeeping: each day can be assigned to at most one city by consuming (free ?d)
    (free ?d - day)
    (day_at ?d - day ?c - city)    ;; day ?d is spent in city ?c
    (visited ?c - city)

    ;; connectivity
    (direct ?from - city ?to - city)

    ;; marker for a recorded travel leg that departs on day ?d and arrives the following day
    (travel_leg ?from - city ?to - city ?d - day)
  )

  ;; assign a city to a single free day (use for the first day of the trip or any non-arrival day)
  (:action assign_day
    :parameters (?d - day ?c - city)
    :precondition (free ?d)
    :effect (and (day_at ?d ?c) (visited ?c) (not (free ?d)))
  )

  ;; fly overnight: depart from ?from on day ?d and arrive at ?to on next day ?d2
  ;; precondition: you are in ?from on departure day and the arrival day is free and there is a direct flight
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (next ?d ?d2) (day_at ?d ?from) (free ?d2) (direct ?from ?to))
    :effect (and
             (travel_leg ?from ?to ?d)
             (day_at ?d2 ?to)
             (visited ?to)
             (not (free ?d2))
            )
  )
)