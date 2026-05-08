(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city)                       ; traveler's current city (exactly one holds in sensible plans)
    (direct ?from ?to - city)            ; allowed direct flight transitions
    (unassigned ?d - day)                ; day token not yet allocated
    (assigned ?d - day ?c - city)        ; day token allocated to a city
  )

  ;; Fly is allowed only along declared direct links.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Use one day token while located at the city to allocate that day to the city.
  (:action stay
    :parameters (?d - day ?c - city)
    :precondition (and (at ?c) (unassigned ?d))
    :effect (and (not (unassigned ?d)) (assigned ?d ?c))
  )
)