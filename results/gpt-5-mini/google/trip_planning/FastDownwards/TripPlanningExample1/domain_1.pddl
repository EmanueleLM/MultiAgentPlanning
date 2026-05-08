(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)
    (direct ?from ?to - city)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (visited ?c - city)
  )

  ;; Fly is allowed only where a direct flight exists (direct ?from ?to).
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Stay assigns one day (a day token) to the city where the agent currently is.
  (:action stay
    :parameters (?d - day ?c - city)
    :precondition (and (at ?c) (unassigned ?d))
    :effect (and (not (unassigned ?d)) (assigned ?d ?c) (visited ?c))
  )
)