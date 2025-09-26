(define (domain itinerary)
  (:requirements :typing :adl :fluents)
  (:types city)
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (direct ?from ?to - city)
  )
  (:functions
    (total-days)
    (spent ?c - city)
  )
  (:action travel
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to) (visited ?to) (increase (total-days) 1))
  )
  (:action allocate-day
    :parameters (?c - city)
    :precondition (at ?c)
    :effect (and (visited ?c) (increase (spent ?c) 1) (increase (total-days) 1))
  )
)