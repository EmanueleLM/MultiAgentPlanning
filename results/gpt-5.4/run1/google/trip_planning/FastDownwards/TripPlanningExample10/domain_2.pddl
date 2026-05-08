(define (domain tripplanningexample10)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (occupied ?c - city ?d - day)
    (flight_done)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?nd)
      (occupied ?c ?d)
      (not (occupied oslo ?nd))
      (not (occupied dublin ?nd))
      (not (occupied valencia ?nd))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (occupied ?c ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?nd)
      (occupied ?from ?d)
      (direct ?from ?to)
      (not (occupied oslo ?nd))
      (not (occupied dublin ?nd))
      (not (occupied valencia ?nd))
      (not (flight_done))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?nd)
      (occupied ?to ?nd)
      (flight_done)
    )
  )
)