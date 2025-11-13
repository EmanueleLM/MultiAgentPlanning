(define (domain TripPlanningExample4)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)        ; city occupancy at a specific day (persistent fact)
    (next ?d - day ?d2 - day)     ; successor relation between consecutive days
    (adj ?c1 - city ?c2 - city)   ; direct-flight adjacency (symmetric edges given in problem init)
    (occupied ?d - day)           ; marks that a day has been assigned exactly one city (prevents double assignment)
  )

  ;; Stay in the same city for the next day.
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2) (not (occupied ?d2)))
    :effect (and (at ?c ?d2) (occupied ?d2))
  )

  ;; Fly along a direct adjacency to be in another city on the next day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (at ?from ?d) (next ?d ?d2) (adj ?from ?to) (not (occupied ?d2)))
    :effect (and (at ?to ?d2) (occupied ?d2))
  )
)