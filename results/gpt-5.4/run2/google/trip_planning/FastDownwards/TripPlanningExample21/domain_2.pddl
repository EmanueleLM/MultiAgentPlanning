(define (domain tripplanningexample21)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (assigned ?d - day ?c - city)
    (workshop_day ?d - day)
    (workshop_attended)
  )

  (:action stay_day
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at ?c)
      (not (assigned ?d ?c))
    )
    :effect (and
      (assigned ?d ?c)
      (not (current ?d))
      (current ?dn)
    )
  )

  (:action stay_day_workshop
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current ?d)
      (next ?d ?dn)
      (at venice)
      (workshop_day ?d)
      (not (assigned ?d venice))
      (not (workshop_attended))
    )
    :effect (and
      (assigned ?d venice)
      (workshop_attended)
      (not (current ?d))
      (current ?dn)
    )
  )

  (:action fly_after_day
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (current ?d)
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)