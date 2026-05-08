(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city)                       ; current location of the traveler
    (direct ?from ?to - city)           ; allowed direct flight transitions
    (unassigned ?d - day)               ; day token not yet allocated
    (assigned ?d - day ?c - city)       ; day token allocated to a city
    (visited ?c - city)                 ; city has been visited (helper/property)
  )

  ;; Fly is permitted only along encoded direct links.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Stay consumes one unassigned day-token and assigns it to the current city.
  (:action stay
    :parameters (?d - day ?c - city)
    :precondition (and (at ?c) (unassigned ?d))
    :effect (and (not (unassigned ?d)) (assigned ?d ?c) (visited ?c))
  )
)