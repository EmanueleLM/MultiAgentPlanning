(define (domain tripplanningexample2)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (at ?c - city)

    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (final ?d - day)

    (visited ?c - city ?d - day)

    (must_be_in ?c - city ?d - day)
    (wedding_window ?d - day)
    (wedding_done)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d)
      (next ?d ?d2)
      (must_be_in ?c ?d)
    )
    :effect (and
      (visited ?c ?d)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current ?d)
      (next ?d ?d2)
      (direct ?from ?to)
      (must_be_in ?to ?d)
      (not (must_be_in ?from ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to ?d)
      (not (current ?d))
      (current ?d2)
    )
  )

  (:action stay_final
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current ?d)
      (final ?d)
      (must_be_in ?c ?d)
    )
    :effect (and
      (visited ?c ?d)
      (not (current ?d))
    )
  )

  (:action fly_final
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at ?from)
      (current ?d)
      (final ?d)
      (direct ?from ?to)
      (must_be_in ?to ?d)
      (not (must_be_in ?from ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?to ?d)
      (not (current ?d))
    )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (at venice)
      (current ?d)
      (wedding_window ?d)
      (must_be_in venice ?d)
      (not (wedding_done))
    )
    :effect (wedding_done)
  )
)