(define (domain tripplanningexample23)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d ?dn - day)
    (today ?d - day)
    (spent ?c - city ?d - day)
    (workshop_window ?d - day)
    (workshop_attended ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c)
      (today ?d)
      (next ?d ?dn)
      (not (spent ?c ?d)))
    :effect (and
      (spent ?c ?d)
      (not (today ?d))
      (today ?dn))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (at ?from)
      (today ?d)
      (next ?d ?dn)
      (direct ?from ?to)
      (not (spent ?to ?d)))
    :effect (and
      (spent ?to ?d)
      (not (at ?from))
      (at ?to)
      (not (today ?d))
      (today ?dn))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (today ?d)
      (at riga)
      (workshop_window ?d)
      (not (workshop_attended ?d)))
    :effect (workshop_attended ?d)
  )
)