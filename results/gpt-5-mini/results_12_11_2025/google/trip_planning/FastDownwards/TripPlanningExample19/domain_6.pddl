(define (domain TripDomain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
  )

  ;; Assign the first day to a city (only if that day is the first and not already assigned)
  (:action assign-first
    :parameters (?d - day ?c - city)
    :precondition (and (first ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?d ?c))
  )

  ;; Assign the next day when staying in the same city (contiguous occupancy)
  (:action assign-next-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (at ?d1 ?c) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 ?c))
  )

  ;; Assign the next day when taking a direct flight along a stored direct edge.
  ;; Direct edges must be initialized in both directions if travel is possible both ways.
  (:action assign-next-edge
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and (next ?d1 ?d2) (at ?d1 ?c1) (direct ?c1 ?c2) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 ?c2))
  )
)