(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next ?d - day ?dn - day)
    (current ?d - day)
    (visited ?c - city)
    (wedding_day ?d - day)
    (wedding_attended)
  )

  (:action start_in
    :parameters (?c - city)
    :precondition
      (and
        (current day1)
        (not (at frankfurt day1))
        (not (at krakow day1))
        (not (at dubrovnik day1))
      )
    :effect
      (and
        (at ?c day1)
        (visited ?c)
      )
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at ?c ?d)
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at ?c ?d))
        (at ?c ?dn)
        (visited ?c)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition
      (and
        (current ?d)
        (next ?d ?dn)
        (at ?from ?d)
        (direct ?from ?to)
        (not (at ?to ?d))
      )
    :effect
      (and
        (not (current ?d))
        (current ?dn)
        (not (at ?from ?d))
        (at ?to ?dn)
        (visited ?to)
      )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition
      (and
        (wedding_day ?d)
        (at krakow ?d)
        (not (wedding_attended))
      )
    :effect
      (wedding_attended)
  )
)