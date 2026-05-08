(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (workshop_done)
    (next_day ?d1 - day ?d2 - day)
    (flight_available ?from - city ?to - city)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next_day ?d1 ?d2) (flight_available ?from ?to))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and (at florence ?d) (not (workshop_done)))
    :effect (workshop_done))
)