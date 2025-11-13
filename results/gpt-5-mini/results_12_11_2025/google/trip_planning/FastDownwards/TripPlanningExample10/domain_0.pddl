(define (domain itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (next ?d1 ?d2 - day)
    (first ?d - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (connected ?c1 ?c2 - city)
  )

  ;; Assign the first calendar day to a city (only if that day is marked as first and not yet assigned).
  (:action set-first-day
    :parameters (?d - day ?c - city)
    :precondition (and (first ?d) (not (assigned ?d)))
    :effect (and (at ?d ?c) (assigned ?d))
  )

  ;; Assign a next day to a city given the previous day's assignment and a valid connection between cities.
  ;; This enforces the linear ordering: a day can be assigned only after its predecessor has been assigned.
  (:action set-next-day
    :parameters (?prev ?d - day ?cprev ?c - city)
    :precondition (and (next ?prev ?d) (at ?prev ?cprev) (connected ?cprev ?c) (not (assigned ?d)))
    :effect (and (at ?d ?c) (assigned ?d))
  )
)