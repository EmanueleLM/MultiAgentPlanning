(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?d - day ?c - city)            ; day d is assigned to city c
    (assigned ?d - day)               ; day has been assigned already (ensures uniqueness)
    (flight ?from - city ?to - city)  ; direct flight available (directed as given)
    (next ?d1 - day ?d2 - day)        ; day adjacency (d2 is the day after d1)
    (first-day ?d - day)              ; marks the first day (start)
  )

  ;; Assign the first day to a city (start of itinerary)
  (:action assign_first
    :parameters (?d - day ?c - city)
    :precondition (and (first-day ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?d ?c))
  )

  ;; Stay in the same city for an adjacent next day
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (assigned ?d1) (at ?d1 ?c) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 ?c))
  )

  ;; Fly via a direct flight from one city to another between adjacent days
  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (next ?d1 ?d2) (assigned ?d1) (at ?d1 ?from) (flight ?from ?to) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 ?to))
  )
)