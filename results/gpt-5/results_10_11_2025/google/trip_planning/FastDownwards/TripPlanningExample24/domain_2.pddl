(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:constants
    florence amsterdam riga - city
  )
  (:predicates
    (at_city ?c - city)
    (on_day ?d - day)
    (next ?d - day ?d2 - day)
    (direct ?a - city ?b - city)
    (must_be ?d - day ?c - city)
    (satisfied ?d - day)
    (workshop_window ?d - day)
    (attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city ?c)
      (must_be ?d ?c)
      (not (satisfied ?d))
    )
    :effect (and
      (satisfied ?d)
      (not (on_day ?d))
      (on_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city ?from)
      (must_be ?d ?from)
      (direct ?from ?to)
      (not (satisfied ?d))
    )
    :effect (and
      (satisfied ?d)
      (not (on_day ?d))
      (on_day ?d2)
      (not (at_city ?from))
      (at_city ?to)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (on_day ?d)
      (workshop_window ?d)
      (at_city florence)
      (not (attended))
    )
    :effect (attended)
  )
)