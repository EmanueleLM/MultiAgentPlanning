(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (stay_slot ?c - city ?d - day)
    (flight_slot ?from - city ?to - city ?d - day)
    (occupied ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at ?c)
      (stay_slot ?c ?d)
      (not (occupied ?c ?d)))
    :effect (and
      (occupied ?c ?d)
      (not (current_day ?d))
      (current_day ?dn))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at ?from)
      (direct ?from ?to)
      (flight_slot ?from ?to ?d)
      (not (occupied ?to ?d)))
    :effect (and
      (occupied ?to ?d)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dn))
  )
)