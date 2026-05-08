(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (at ?c - city)
    (occupies ?c - city ?d - day)
    (workshop_day ?d - day)
    (workshop_attended)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current day1)
      (not (at london))
      (not (at bucharest))
      (not (at riga))
      (not (occupies london day1))
      (not (occupies bucharest day1))
      (not (occupies riga day1))
    )
    :effect (and
      (at ?c)
      (occupies ?c day1)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (occupies london ?d2))
      (not (occupies bucharest ?d2))
      (not (occupies riga ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (occupies ?c ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (occupies london ?d2))
      (not (occupies bucharest ?d2))
      (not (occupies riga ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (occupies ?to ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (workshop_day ?d)
      (at riga)
      (occupies riga ?d)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )
)