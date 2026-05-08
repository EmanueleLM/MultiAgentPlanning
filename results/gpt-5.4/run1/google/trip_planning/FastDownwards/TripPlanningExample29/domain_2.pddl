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
    (wedding_window ?d - day)
    (in_krakow_on_wedding_day)
  )

  (:action start_in_city
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
        (when_dummy)
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
      )
  )

  (:action mark_wedding_attendance
    :parameters (?d - day)
    :precondition
      (and
        (wedding_window ?d)
        (at krakow ?d)
        (not (in_krakow_on_wedding_day))
      )
    :effect
      (and
        (in_krakow_on_wedding_day)
      )
  )
)