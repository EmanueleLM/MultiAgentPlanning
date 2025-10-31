(define (domain itinerary-direct-flights)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (free ?d - day)
    (assigned ?d - day ?c - city)
    (prev ?dp - day ?dn - day)
    (start ?d - day)
    (direct ?c1 - city ?c2 - city)
  )

  ;; Assign day1 to a city (no previous day required; start predicate marks day1)
  (:action assign-start
    :parameters (?d - day ?c - city)
    :precondition (and (start ?d) (free ?d))
    :effect (and (assigned ?d ?c) (not (free ?d)))
  )

  ;; Stay in the same city from previous day to current day
  (:action assign-stay
    :parameters (?dp - day ?dn - day ?c - city)
    :precondition (and (prev ?dp ?dn) (assigned ?dp ?c) (free ?dn))
    :effect (and (assigned ?dn ?c) (not (free ?dn)))
  )

  ;; Fly from previous city to a different city (requires explicit direct link)
  (:action assign-fly
    :parameters (?dp - day ?dn - day ?cp - city ?cn - city)
    :precondition (and (prev ?dp ?dn) (assigned ?dp ?cp) (free ?dn) (direct ?cp ?cn))
    :effect (and (assigned ?dn ?cn) (not (free ?dn)))
  )
)