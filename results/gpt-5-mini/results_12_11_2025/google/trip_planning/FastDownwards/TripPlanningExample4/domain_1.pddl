(define (domain TripPlanningExample4)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)        ; city occupancy recorded for a specific day (persistent)
    (next ?d - day ?d2 - day)     ; successor relation between consecutive days
    (adj ?c1 - city ?c2 - city)   ; direct flight adjacency (direct flights allowed)
    (occupied ?d - day)           ; marks that a day has already been assigned a city
  )

  ;; Stay in same city for next day (assign next day to same city).
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at ?c ?d2) (occupied ?d2))
  )

  ;; Fly from one city to another for the next day (only allowed if direct adjacency).
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (adj ?from ?to) (not (occupied ?d2)))
    :effect (and (at ?to ?d2) (occupied ?d2))
  )
)