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
    (last_day ?d - day)
  )

  (:action stay_mid
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city ?c)
      (must_be ?d ?c)
      (must_be ?d2 ?c)
      (not (satisfied ?d))
    )
    :effect (and
      (satisfied ?d)
      (not (on_day ?d))
      (on_day ?d2)
    )
  )

  (:action fly_mid
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (on_day ?d)
      (next ?d ?d2)
      (at_city ?from)
      (must_be ?d ?from)
      (must_be ?d2 ?to)
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

  (:action stay_last
    :parameters (?c - city ?d - day)
    :precondition (and
      (on_day ?d)
      (last_day ?d)
      (at_city ?c)
      (must_be ?d ?c)
      (not (satisfied ?d))
    )
    :effect (satisfied ?d)
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