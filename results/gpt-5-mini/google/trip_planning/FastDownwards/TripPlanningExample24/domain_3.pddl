(define (domain itinerary_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (in_day ?d - day ?c - city)
    (assigned ?d - day)
    (workshop_held)
    (direct ?from - city ?to - city)
    (is_florence ?c - city)
    (workshop_window ?d - day)
  )

  (:action assign_day
    :parameters (?d - day ?c - city)
    :precondition (and (not (assigned ?d)))
    :effect (and (in_day ?d ?c) (assigned ?d))
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (in_day ?d1 ?c) (not (assigned ?d2)))
    :effect (and (in_day ?d2 ?c) (assigned ?d2))
  )

  (:action flight_travel
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (next ?d1 ?d2) (in_day ?d1 ?from) (direct ?from ?to) (not (assigned ?d2)))
    :effect (and (in_day ?d2 ?to) (assigned ?d2))
  )

  (:action schedule_workshop
    :parameters (?d - day ?c - city)
    :precondition (and (in_day ?d ?c) (is_florence ?c) (workshop_window ?d) (not (workshop_held)))
    :effect (workshop_held)
  )
)