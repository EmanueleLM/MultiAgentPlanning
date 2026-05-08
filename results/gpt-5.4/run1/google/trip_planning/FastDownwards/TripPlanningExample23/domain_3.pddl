(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (current ?d - day)
    (spent ?d - day ?c - city)
    (workshop_day ?d - day)
    (attended_workshop)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (not (at london))
      (not (at bucharest))
      (not (at riga))
      (not (spent d1 london))
      (not (spent d1 bucharest))
      (not (spent d1 riga))
    )
    :effect (and
      (at ?c)
      (spent d1 ?c)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (spent ?d2 london))
      (not (spent ?d2 bucharest))
      (not (spent ?d2 riga))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (spent ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (spent ?d2 london))
      (not (spent ?d2 bucharest))
      (not (spent ?d2 riga))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (spent ?d2 ?to)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (workshop_day ?d)
      (at riga)
      (spent ?d riga)
      (not (attended_workshop))
    )
    :effect (attended_workshop)
  )
)