(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?dn - day)
    (current_day ?d - day)
    (in_city_on ?c - city ?d - day)
    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay_day
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?dn)
      (not (in_city_on ?c ?d)))
    :effect (and
      (in_city_on ?c ?d)
      (not (current_day ?d))
      (current_day ?dn))
  )

  (:action fly_and_stay_day
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?dn)
      (direct ?from ?to)
      (not (in_city_on ?to ?d)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (in_city_on ?to ?d)
      (not (current_day ?d))
      (current_day ?dn))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at riga)
      (workshop_window ?d)
      (not (workshop_attended)))
    :effect (workshop_attended)
  )
)