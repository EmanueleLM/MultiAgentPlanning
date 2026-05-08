(define (domain itinerary-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (in-day ?d - day ?c - city)
    (assigned ?d - day)
    (workshop-held)
    (direct ?from - city ?to - city)
  )

  (:action assign-day
    :parameters (?d - day ?c - city)
    :precondition (and (not (assigned ?d)))
    :effect (and (in-day ?d ?c) (assigned ?d))
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (in-day ?d1 ?c) (not (assigned ?d2)))
    :effect (and (in-day ?d2 ?c) (assigned ?d2))
  )

  (:action flight-travel
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (next ?d1 ?d2) (in-day ?d1 ?from) (direct ?from ?to) (not (assigned ?d2)))
    :effect (and (in-day ?d2 ?to) (assigned ?d2))
  )

  (:action schedule-workshop
    :parameters (?d - day)
    :precondition (and (in-day ?d florence) (not (workshop-held)))
    :effect (workshop-held)
  )
)