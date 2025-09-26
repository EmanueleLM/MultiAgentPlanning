(define (domain itinerary)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (direct ?from ?to - city)
    (current-day ?d - day)
    (next ?d1 ?d2 - day)
    (assigned ?d - day ?c - city)
    (unassigned ?d - day)
  )

  (:action travel
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from) (direct ?from ?to) (current-day ?d))
    :effect (and (not (at ?from)) (at ?to) (visited ?to))
  )

  (:action assign-day
    :parameters (?d - day ?n - day ?c - city)
    :precondition (and (current-day ?d) (next ?d ?n) (at ?c) (unassigned ?d))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)) (not (current-day ?d)) (current-day ?n) (visited ?c))
  )
)