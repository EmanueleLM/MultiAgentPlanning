(define (domain TripDomain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
    (window ?d - day)
    (meeting-city ?c - city)
  )

  ;; Assign the first day to a city (only if not already assigned)
  (:action assign-first
    :parameters (?d - day ?c - city)
    :precondition (and (first ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?d ?c))
  )

  ;; Assign a next day based on the previous day's city and a direct flight (direct includes self-edges).
  ;; This enforces contiguous progression day-by-day.
  (:action assign-next
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and
                    (next ?d1 ?d2)
                    (at ?d1 ?c1)
                    (direct ?c1 ?c2)
                    (not (assigned ?d2))
                  )
    :effect (and (assigned ?d2) (at ?d2 ?c2))
  )
)